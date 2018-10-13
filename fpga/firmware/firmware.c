// GNSS Firehose firmware
//
// Copyright 2017 Peter Monta
//

#define N_CHANNEL 3
#define N_ADC     4

unsigned int jiffies;           // system time
int link_up;                    // Ethernet link status
int phy_poll_enable;            // poll the Ethernet PHY SMI bus
int agc_enable;                 // gain control: automatic or manual
int gain[N_CHANNEL];            // channel gains (10-bit PWM)

int IPaddr = 0xC0A8142D; //192.168.20.45
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



void eth_service()
{ if (!eth_rx_ready())
    return;
  process_eth_packet(); }

void uart_service()
{ if (!uart_rx_ready())
    return;
  process_char(uart_rx_data()); }

void hw_init()
{ clock_init();
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
  phy_poll_enable = 0;         // enable PHY polling by default
  agc_enable = 1;              // enable AGC by default
  spi_read_config(); }         // read and apply configuration and calibration parameters from flash

void poll()
{ unsigned int j;
  j = get_jiffies();
  if (j==jiffies)          // has jiffies counter changed?
    return;
  jiffies = j;             // do once per jiffy (once per approx. 30 ms):
  if (agc_enable)
    agc_service();         // service the AGC loops
  if (phy_poll_enable)
    phy_service(); }       // poll Ethernet PHY for link status

//
// main loop
//

int main()
{ hw_init();            // initialize hardware
  puts("Boot\n");
  for (;;) {
    uart_service();     // service any UART commands
    eth_service();      // service any Ethernet commands
    poll(); }           // low-rate polling of various background services

  return 0; }
