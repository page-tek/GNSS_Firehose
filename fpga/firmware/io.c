// output ports

#define PORT_CLOCK             0
#define PORT_LOOPBACK_OUT      1
#define PORT_LED               2
#define PORT_OUT_PHY_SMI       4
#define PORT_OUT_PWM           6
#define PORT_ADC_SPI_OUT      12
#define PORT_FLASH_SPI_OUT    31
#define PORT_I2C              17
#define PORT_STREAMER_ENABLE  21
#define PORT_DC_BASE          22
#define PORT_DCM_RST          30
#define PORT_UART_TX_DATA     32
#define PORT_UART_RX_READ     33
#define PORT_UART_TX_WRITE    34
#define PORT_MAC_ADDR         40
#define PORT_ETH_RX_READ      48
#define PORT_ETH_RX_RADDR     49
#define PORT_ETH_TX_ADDR      50
#define PORT_ETH_TX_DATA      51
#define PORT_ETH_TX_WE        52
#define PORT_ETH_TX_READY     53

// input ports

#define PORT_CLOCK_IN          0
#define PORT_LOOPBACK_IN       1
#define PORT_IN_PHY_SMI        2
#define PORT_ADC_SPI_IN        5
#define PORT_HIST             20
#define PORT_UART_RX_DATA     32
#define PORT_UART_RX_READY    33
#define PORT_UART_TX_READY    34
#define PORT_JIFFIES          44
#define PORT_FLASH_SPI_IN     48
#define PORT_ETH_RX_RDATA     50
#define PORT_ETH_RX_READY     51

#define barrier() asm volatile("" ::: "memory")

unsigned int port_read(unsigned int p)
{ barrier();
  return (unsigned int)(*(volatile unsigned int*)(0x80000000+4*p)); }

void port_write(unsigned int p,unsigned int x)
{ barrier();
  (*(volatile unsigned int*)(0x80000000+4*p)) = x; }

void clock_out(int x)
{ port_write(PORT_CLOCK,x); }

void led(int x)
{ port_write(PORT_LED,x); }

void uart_tx_data(int x)
{ port_write(PORT_UART_TX_DATA,x);
  port_write(PORT_UART_TX_WRITE,1);
  port_write(PORT_UART_TX_WRITE,0); }

int uart_tx_ready()
{ return port_read(PORT_UART_TX_READY); }

int uart_rx_data()
{ unsigned int x;
  x = port_read(PORT_UART_RX_DATA);
  port_write(PORT_UART_RX_READ,1);
  port_write(PORT_UART_RX_READ,0);
  return x; }

int uart_rx_ready()
{ return port_read(PORT_UART_RX_READY); }

inline int eth_rx_data_set_addr(int addr)
{
  port_write(PORT_ETH_RX_RADDR,addr);
}

unsigned int eth_rx_data_byte()
{
  return port_read(PORT_ETH_RX_RDATA);
}

unsigned int eth_rx_data_2byte()
{ unsigned int x0,x1;
  x0 = eth_rx_data_byte();
  x1 = eth_rx_data_byte();
  return (x0<<8) | x1;
}

unsigned int eth_rx_data_4byte()
{ unsigned int x0,x1,x2,x3;
  x0 = eth_rx_data_byte();
  x1 = eth_rx_data_byte();
  x2 = eth_rx_data_byte();
  x3 = eth_rx_data_byte();
  return (x0<<24) | (x1<<16) | (x2<<8) | x3;
}

void eth_rx_ack()
{ port_write(PORT_ETH_RX_READ,1);
  //delay_200ns();
  port_write(PORT_ETH_RX_READ,0); }

int eth_rx_ready()
{ return port_read(PORT_ETH_RX_READY); }

inline void eth_tx_data_set_addr(unsigned int addr)
{
  port_write(PORT_ETH_TX_ADDR,addr);
}

void eth_tx_data_byte(unsigned int val)
{ 
  port_write(PORT_ETH_TX_DATA,val);
  port_write(PORT_ETH_TX_WE,1);
  //delay_200ns();
  //port_write(PORT_ETH_TX_WE,0);
}

void eth_tx_data_2byte(unsigned int val)
{ 
  eth_tx_data_byte((val>>8)&0xFF);
  eth_tx_data_byte(val&0xFF);
}

void eth_tx_data_4byte(unsigned int val)
{ 
  eth_tx_data_byte((val>>24)&0xFF);
  eth_tx_data_byte((val>>16)&0xFF);
  eth_tx_data_byte((val>>8)&0xFF);
  eth_tx_data_byte(val&0xFF);
}

void eth_tx_send()
{
  port_write(PORT_ETH_TX_READY,1);
  //delay_100us();
  port_write(PORT_ETH_TX_READY,0);
}

unsigned int get_jiffies()
{ return port_read(PORT_JIFFIES); }

void putchar(char c)
{ while (!uart_tx_ready()) ;
  uart_tx_data(c); }

void puts(char* s)
{ char c;
  while (c=*s++)
    putchar(c); }

void putint(unsigned int u)
{
  unsigned int t;
  unsigned int b = 1;

  while (u / b) b = b * 10;
  b = b / 10;  
  if (b) {
    while (b) {
      t = u / b;
      putchar((char)(t + '0'));
	  u = u - (t * b);
      b = b / 10;
	}
  } else {
    putchar('0');
  }
}

void puthex(char u)
{
  const char HEX [16] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};

  putchar(HEX[(u >> 4) & 0x0F]);
  putchar(HEX[u & 0x0F]);
}

