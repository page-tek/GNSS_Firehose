

void process_eth_packet()
{ 
  int step;
  unsigned int checksum;
  unsigned int sIPaddr;
  char buf[8]={0,0,0,0,0,0,0,0};

  if (!link_up)
  {
    //Check for ARP packet
    eth_rx_data_set_addr(6);
    if (eth_rx_data_2byte()==0x0806) 
    {
      // Got an ARP ethertype, is the IP address mine
      eth_rx_data_set_addr(32);
      if (eth_rx_data_4byte()==IPaddr)
      {
        // It's got my IP address, is it a request
        eth_rx_data_set_addr(15);
        if (eth_rx_data_byte()==1) 
        {
          // It a request, let's build a respond
          //eth_tx_data_set_addr(0);
          eth_rx_data_set_addr(0);
          eth_tx_data_set_addr(0);
          for(step=0;step<6;step++)
            eth_tx_data_byte(eth_rx_data_byte()); //dest MAC
          for(step=0;step<6;step++)
            eth_tx_data_byte(MACaddr[step]); //source MAC
          eth_tx_data_2byte(0x0806); // ARP ethertype
          eth_tx_data_2byte(0x0001); // Hardware type
          eth_tx_data_2byte(0x0800); // Protocol type
          eth_tx_data_byte(0x06);    // Hardware len
          eth_tx_data_byte(0x04);    // Protocol len
          eth_tx_data_2byte(0x0002); // Operation
          for(step=0;step<6;step++)
            eth_tx_data_byte(MACaddr[step]); //source MAC
          eth_tx_data_4byte(IPaddr); // source IP
          eth_rx_data_set_addr(16);
          for(step=0;step<10;step++)
            eth_tx_data_byte(eth_rx_data_byte()); //target MAC+IP
          for(step=0;step<22;step++)
            eth_tx_data_byte(0x00);
          eth_tx_send();
        }  
      } 
    }
  }

  //check for UDP packet
  eth_rx_data_set_addr(6);
  if (eth_rx_data_2byte()==0x0800) {
    // Got an IP ethertype, is it UDP
    eth_rx_data_set_addr(17);
    if (eth_rx_data_byte()==0x11) {
      // Got UDP packet, is it for me
      eth_rx_data_set_addr(24);
      if (eth_rx_data_4byte()==IPaddr) {
        eth_rx_data_set_addr(20);
        sIPaddr = eth_rx_data_4byte();
        // It's for me let's process it.
        process_eth_cmd(buf);
        // Let's build the return packer
        eth_rx_data_set_addr(0);
        eth_tx_data_set_addr(0);
        for(step=0;step<6;step++)
          eth_tx_data_byte(eth_rx_data_byte()); //dest MAC
        for(step=0;step<6;step++)
          eth_tx_data_byte(MACaddr[step]); //source MAC
        eth_tx_data_2byte(0x0800); // IPv4 ethertype
        eth_tx_data_2byte(0x4500);
		eth_tx_data_2byte(0x0032); // IPv4 head + UPD head + data
        eth_tx_data_2byte(0x0000); // ID
        eth_tx_data_2byte(0x4000); // flags + frag
        eth_tx_data_byte(0x40);   // Time to Live
        eth_tx_data_byte(0x11);   // UDP
        checksum = 0xC543;
        checksum += ((IPaddr>>16)&0xFFFF) + (IPaddr & 0xFFFF);
        checksum += ((sIPaddr>>16)&0xFFFF) + (sIPaddr & 0xFFFF);
        checksum = (checksum & 0xFFFF) + (checksum >> 16);
        checksum = ~checksum;
        eth_tx_data_2byte(checksum);
        eth_tx_data_4byte(IPaddr);
        eth_tx_data_4byte(sIPaddr); //end of IP header
        eth_tx_data_2byte(0x88b6); // Port
        eth_tx_data_2byte(0x88b6); // Port
        eth_tx_data_2byte(0x001E); // Length UDP head + data
        eth_tx_data_2byte(0x0000); // Checksum not implemented
        for(step=0;step<8;step++)
           eth_tx_data_byte(buf[step]); //data
        for(step=0;step<14;step++)
           eth_tx_data_byte(0x00);      //padding
        eth_tx_send();
      }
    }
  }
  eth_rx_ack();
}

void setup_stream_packet()
{
  int step;
  unsigned int checksum;
  unsigned int sIPaddr;

  // Let's use the last information in the RX buffer to send
  // the stream to. Could this be out of date, maybe
  eth_rx_data_set_addr(20);
  sIPaddr = eth_rx_data_4byte();
  eth_rx_data_set_addr(0);
  eth_tx_data_set_addr(0);
  for(step=0;step<6;step++)
    eth_tx_data_byte(eth_rx_data_byte()); //dest MAC
  for(step=0;step<6;step++)
    eth_tx_data_byte(MACaddr[step]); //source MAC
  eth_tx_data_2byte(0x0800); // IPv4 ethertype
  eth_tx_data_2byte(0x4500);
  eth_tx_data_2byte(0x05BC); // IPv4 head (20) + UPD head (8) + data (1440)
  eth_tx_data_2byte(0x0000); // ID
  eth_tx_data_2byte(0x4000); // flags + frag
  eth_tx_data_byte(0x40);   // Time to Live
  eth_tx_data_byte(0x11);   // UDP
  checksum = 0xCACD;
  checksum += ((IPaddr>>16)&0xFFFF) + (IPaddr & 0xFFFF);
  checksum += ((sIPaddr>>16)&0xFFFF) + (sIPaddr & 0xFFFF);
  checksum = (checksum & 0xFFFF) + (checksum >> 16);
  checksum = ~checksum;
  eth_tx_data_2byte(checksum);
  eth_tx_data_4byte(IPaddr);
  eth_tx_data_4byte(sIPaddr); //end of IP header
  eth_tx_data_2byte(0x88b5); // Port
  eth_tx_data_2byte(0x88b5); // Port
  eth_tx_data_2byte(0x05A8); // Length UDP head (8) + data (1440)
  eth_tx_data_2byte(0x0000); // Checksum not implemented
}

