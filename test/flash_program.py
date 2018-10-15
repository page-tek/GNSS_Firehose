#!/usr/bin/python

import hw
import sys

h = hw.hw()

mac_string = sys.argv[1]
ip_string = sys.argv[2].split('.')

h.spi_sector_erase()

h.spi_write(0x7ff00,1)    # MAC ID
h.spi_write(0x7ff01,6)    # Length 
for i in range(6):        # MAC
  byte = int('0x'+mac_string[3*i:3*i+2],16)
  print byte
  h.spi_write(0x7ff02+i,byte)

h.spi_write(0x7ff08,3)    # IP ID
h.spi_write(0x7ff09,4)    # Length
for i in range(4):        # IP
  byte = int(ip_string[i])
  print byte
  h.spi_write(0x7ff0A+i,byte)
   


#h.spi_dump()
#h.spi_status()
