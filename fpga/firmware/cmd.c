int global_read(int addr)
{ switch (addr) {
    case 0: return gain[0]&0xff; break;
    case 1: return (gain[0]>>8)&0xff; break;
    case 2: return gain[1]&0xff; break;
    case 3: return (gain[1]>>8)&0xff; break;
    case 4: return gain[2]&0xff; break;
    case 5: return (gain[2]>>8)&0xff; break;
    case 6: return link_up; break;
    case 7: return agc_enable; break;
    case 8: return uart_phy; break;
    default: return 0; } }

void global_set(int addr,int val)
{ switch (addr) {
    case 0: gain[0] = (gain[0]&0xffffff00) | (val&0xff); break;
    case 1: gain[0] = (gain[0]&0xffff00ff) | ((val&0xff)<<8); break;
    case 2: gain[1] = (gain[1]&0xffffff00) | (val&0xff); break;
    case 3: gain[1] = (gain[1]&0xffff00ff) | ((val&0xff)<<8); break;
    case 4: gain[2] = (gain[2]&0xffffff00) | (val&0xff); break;
    case 5: gain[2] = (gain[2]&0xffff00ff) | ((val&0xff)<<8); break;
    case 7: agc_enable = val; break;
    case 8: uart_phy = val; break; } }

unsigned char addr;             // UART command address
unsigned char data;             // UART command data

void process_char(char c)
{ switch (c) {
    case 'm':  addr = data; break;
    case 'w':  port_write(addr,data); break;
    case 'r':  putchar(port_read(addr)); break;
    case 'x':  putchar(addr); break;
    case 'p':  phy_read(addr); break;
    case 'f':  putchar(spi_read(0x7ff00+addr)); break;
    case 's':  putchar(global_read(addr)); break;
    default:  data = (data<<4) | (c&0x0f); data &= 0xff; break; } }

#define CMD_PORT_WRITE               1
#define CMD_PORT_READ                2
#define CMD_ADC_WRITE_REG            3
#define CMD_ADC_READ_REG             4
#define CMD_GLOBAL_WRITE             5
#define CMD_GLOBAL_READ              6
#define CMD_CLOCK_WRITE_REG          7
#define CMD_CLOCK_READ_REG           8
#define CMD_PHY_WRITE_REG            9
#define CMD_PHY_READ_REG            10
#define CMD_FLASH_READ              11
#define CMD_FLASH_WRITE             12
#define CMD_FLASH_ERASE_CONFIG_AREA 13
#define CMD_MAX2112_WRITE_REG       14
#define CMD_MAX2112_READ_REG        15

void process_eth_packet()
{ int cmd;
  unsigned int tag;
  unsigned char addr, val, channel;
  unsigned int waddr, wval;
  tag = eth_rx_wdata(0);
  cmd = eth_rx_data(4);
  switch (cmd) {
    case CMD_PORT_WRITE:
      addr = eth_rx_data(5);
      val = eth_rx_data(6);
      port_write(addr,val);
      eth_tx_ack(tag,0);
      break;
    case CMD_PORT_READ:
      addr = eth_rx_data(5);
      val = port_read(addr);
      eth_tx_ack(tag,val);
      break;
    case CMD_ADC_WRITE_REG:
      channel = eth_rx_data(5);
      addr = eth_rx_data(6);
      val = eth_rx_data(7);
      adc_write(channel,addr,val);
      eth_tx_ack(tag,0);
      break;
    case CMD_ADC_READ_REG:
      channel = eth_rx_data(5);
      addr = eth_rx_data(6);
      val = adc_read(channel,addr);
      eth_tx_ack(tag,val);
      break;
    case CMD_GLOBAL_WRITE:
      addr = eth_rx_data(5);
      val = eth_rx_data(6);
      global_set(addr,val);
      eth_tx_ack(tag,0);
      break;
    case CMD_GLOBAL_READ:
      addr = eth_rx_data(5);
      val = global_read(addr);
      eth_tx_ack(tag,val);
      break;
    case CMD_CLOCK_WRITE_REG:
      addr = eth_rx_data(5);
      wval = eth_rx_wdata(6);
      wval = (wval&0xffffffe0) | (addr&0x0000001f);
      clock_write(wval);
      eth_tx_ack(tag,0);
      break;
    case CMD_CLOCK_READ_REG:
      addr = eth_rx_data(5);
      wval = clock_read(addr);
      eth_tx_ack_word(tag,wval);
      break;
    case CMD_PHY_WRITE_REG:
      addr = eth_rx_data(5);
      wval = eth_rx_wdata(6);
      phy_smi_write(addr,wval);
      eth_tx_ack(tag,0);
      break;
    case CMD_PHY_READ_REG:
      addr = eth_rx_data(5);
      wval = phy_smi_read(addr);
      eth_tx_ack_word(tag,wval);
      break;
    case CMD_FLASH_READ:
      waddr = eth_rx_wdata(5);
      val = spi_read(waddr);
      eth_tx_ack(tag,val);
      break;
    case CMD_FLASH_WRITE:
      waddr = eth_rx_wdata(5);
      val = eth_rx_data(9);
      if ((waddr<0x70000) || (waddr>0x7ffff))
        eth_tx_ack(tag,1);
      else {
        spi_write(waddr,val);
        eth_tx_ack(tag,0); }
      break;
    case CMD_FLASH_ERASE_CONFIG_AREA:
      spi_sector_erase(0x70000);
      eth_tx_ack(tag,0);
      break;
    case CMD_MAX2112_WRITE_REG:
      channel = eth_rx_data(5);
      addr = eth_rx_data(6);
      val = eth_rx_data(7);
      i2c_write(channel,addr,val);
      eth_tx_ack(tag,0);
      break;
    case CMD_MAX2112_READ_REG:
      channel = eth_rx_data(5);
      addr = eth_rx_data(6);
      val = i2c_read(channel,addr);
      eth_tx_ack(tag,val);
      break; }
  eth_rx_ack(); }
