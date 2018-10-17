// GNSS Firehose firmware
//
// Copyright 2017 Peter Monta
//

#define N_CHANNEL 3
#define N_ADC     4

unsigned int jiffies;          // system time
int link_up = 0;               // Ethernet link status
int phy_stream = 0;            // disable streaming by default
int agc_enable = 0;            // gain control manual
int gain[N_CHANNEL];           // channel gains (10-bit PWM)

char startup_msg[] = "\r\nGNSS Firehose\r\n";
char IP_msg[] = "IP Address = ";
char MAC_msg[] = "MAC Address = ";

// default settings
int IPaddr = 0xC0A80101; //192.168.20.45
char MACaddr[6] = {0x00,0x01,0x02,0x03,0x04,0x09};

#include "delay.c"
#include "io.c"
#include "clock.c"
#include "adc.c"
#include "max2112.c"
#include "agc.c"
#include "ethernet.c"
#include "flash.c"
#include "cmd.c"
#include "ip.c"



void hw_init()
{
  clock_init();
  port_write(PORT_DCM_RST,1);
  delay_10ms();
  port_write(PORT_DCM_RST,0);
  delay_10ms();
  adc_init(1);
  //adc_init(2);
  //adc_init(3);
  //adc_init(4);
  max2112_init(1,45,0x4a000);  // RF channel 1, N=45 (L1), F=0x4a000  1584.754875 MHz
  //max2112_init(2,35,0x16000);  // RF channel 2, N=35 (L2), F=0x16000  1227.727125 MHz
  //max2112_init(3,34,0x0e000);  // RF channel 3, N=34 (L5), F=0x0e000  1191.641625 MHz
  set_agc(1,240);              // initial AGC value: 240
  set_agc(2,240);
  set_agc(3,240);
  agc_enable = 1;              // enable automatic AGC
  spi_read_config();           // read and apply configuration and calibration parameters from flash
}

//
// main loop
//

int main()
{ 
  int i;
  unsigned int j;

  puts(startup_msg);
  hw_init();            // initialize hardware
  puts(IP_msg);         // print IP address
  putint((IPaddr>>24)&0xFF);
  putchar('.');
  putint((IPaddr>>16)&0xFF);
  putchar('.'); 
  putint((IPaddr>>8)&0xFF);
  putchar('.'); 
  putint((IPaddr)&0xFF);
  puts("\r\n");
  puts(MAC_msg);        // print MAC address
  for(i=0;i<5;i++) {
    puthex(MACaddr[i]);
    putchar(':');
  }
  puthex(MACaddr[5]);
  puts("\r\n");

  for (;;)
  {
    if (uart_rx_ready())            // service any UART commands
      process_char(uart_rx_data());

    if (eth_rx_ready())             // service any Ethernet commands
      process_eth_packet();

    if (link_up && phy_stream==0x01)
    {
      setup_stream_packet();
      port_write(PORT_STREAMER_ENABLE,1);  //start steamer
      phy_stream==0xFF;
    }

    j = get_jiffies();              // low-rate polling of various background services
    if (j!=jiffies)                 // has jiffies counter changed?
    {
      jiffies = j;                  // do once per jiffy (once per approx. 30 ms):
      if (agc_enable)
        agc_service();              // service the AGC loops
      phy_service();                // update Ethernet PHY link status
    }
  }
  return 0;
}
