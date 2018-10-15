int global_read(int addr)
{ 
  switch (addr) 
    {
      case 0: return gain[0]&0xff; break;
      case 1: return (gain[0]>>8)&0xff; break;
      case 2: return gain[1]&0xff; break;
      case 3: return (gain[1]>>8)&0xff; break;
      case 4: return gain[2]&0xff; break;
      case 5: return (gain[2]>>8)&0xff; break;
      case 6: return link_up; break;
      case 7: return agc_enable; break;
      case 8: return phy_poll_enable; break;
      default: return 0;
    }
}


void global_set(int addr,int val)
{ 
  switch (addr)
    {
      case 0: gain[0] = (gain[0]&0xffffff00) | (val&0xff); break;
      case 1: gain[0] = (gain[0]&0xffff00ff) | ((val&0xff)<<8); break;
      case 2: gain[1] = (gain[1]&0xffffff00) | (val&0xff); break;
      case 3: gain[1] = (gain[1]&0xffff00ff) | ((val&0xff)<<8); break;
      case 4: gain[2] = (gain[2]&0xffffff00) | (val&0xff); break;
      case 5: gain[2] = (gain[2]&0xffff00ff) | ((val&0xff)<<8); break;
      case 7: agc_enable = val; break;
      case 8: phy_poll_enable = val; break;
    }
}


void process_char(char c)
{
static unsigned char addr;  // UART command address
static unsigned char data;  // UART command data

  switch (c) 
    { 
      case 'm':  addr = data; break;
      case 'w':  port_write(addr,data); break;
      case 'r':  putchar(port_read(addr)); break;
      case 'x':  putchar(addr); break;
      case 'p':  phy_read(addr); break;
      case 'f':  putchar(spi_read(0x7ff00+addr)); break;
      case 's':  putchar(global_read(addr)); break;
      default:  data = (data<<4) | (c&0x0f); data &= 0xff; break;
    }
}

void memcpy(void *dest, void *src, char n) 
{ 
   // Typecast src and dest addresses to (char *) 
   char *csrc = (char *)src; 
   char *cdest = (char *)dest; 
  
   // Copy contents of src[] to dest[] 
   for (int i=0; i<n; i++) 
       cdest[i] = csrc[i]; 
} 


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

void process_eth_cmd(char* buf)
{ int cmd;
  unsigned int tag;
  unsigned char addr, val, channel;
  unsigned int waddr, wval;
  
  eth_rx_data_set_addr(36);
  //copy tag across
  buf[0] = eth_rx_data_byte();
  buf[1] = eth_rx_data_byte();
  buf[2] = eth_rx_data_byte();
  buf[3] = eth_rx_data_byte();
  cmd = eth_rx_data_byte();
  switch (cmd) {
    case CMD_PORT_WRITE:
      addr = eth_rx_data_byte();
      val = eth_rx_data_byte();
      port_write(addr,val);
      break;
    case CMD_PORT_READ:
      addr = eth_rx_data_byte();
      val = port_read(addr);
      memcpy(buf+4,&val,1);
      break;
    case CMD_ADC_WRITE_REG:
      channel = eth_rx_data_byte();
      addr = eth_rx_data_byte();
      val = eth_rx_data_byte();
      adc_write(channel,addr,val);
      break;
    case CMD_ADC_READ_REG:
      channel = eth_rx_data_byte();
      addr = eth_rx_data_byte();
      val = adc_read(channel,addr);
      memcpy(buf+4,&val,1);
      break;
    case CMD_GLOBAL_WRITE:
      addr = eth_rx_data_byte();
      val = eth_rx_data_byte();
      global_set(addr,val);
      break;
    case CMD_GLOBAL_READ:
      addr = eth_rx_data_byte();
      val = global_read(addr);
      memcpy(buf+4,&val,1);
      break;
    case CMD_CLOCK_WRITE_REG:
      addr = eth_rx_data_byte();
      wval = eth_rx_data_4byte();
      wval = (wval&0xffffffe0) | (addr&0x0000001f);
      clock_write(wval);
      break;
    case CMD_CLOCK_READ_REG:
      addr = eth_rx_data_byte(5);
      wval = clock_read(addr);
      memcpy(buf+4,&wval,4);
      break;
    case CMD_PHY_WRITE_REG:
      addr = eth_rx_data_byte(5);
      wval = eth_rx_data_4byte(6);
      phy_smi_write(addr,wval);
      break;
    case CMD_PHY_READ_REG:
      addr = eth_rx_data_byte();
      wval = phy_smi_read(addr);
      memcpy(buf+4,&wval,4);
      break;
    case CMD_FLASH_READ:
      waddr = eth_rx_data_4byte(5);
      val = spi_read(waddr);
      memcpy(buf+4,&val,1);
      break;
    case CMD_FLASH_WRITE:
      waddr = eth_rx_data_4byte();
      val = eth_rx_data_byte();
      if ((eth_rx_data_byte()!=0xbe) || (eth_rx_data_byte()!=0xef))
        *(buf+4) = 0x01;
      else {
        spi_write(waddr,val);
        }
      break;
    case CMD_FLASH_ERASE_CONFIG_AREA:
      waddr = eth_rx_data_4byte();
      if ((eth_rx_data_byte()!=0xbe) || (eth_rx_data_byte()!=0xef))
        *(buf+4) = 0x01;
      else {
        spi_sector_erase(waddr);
        }
      break;
    case CMD_MAX2112_WRITE_REG:
      channel = eth_rx_data_byte();
      addr = eth_rx_data_byte();
      val = eth_rx_data_byte();
      i2c_write(channel,addr,val);
      break;
    case CMD_MAX2112_READ_REG:
      channel = eth_rx_data_byte();
      addr = eth_rx_data_byte();
      val = i2c_read(channel,addr);
      memcpy(buf+4,&val,1);
      break;
    }
  return;
}
