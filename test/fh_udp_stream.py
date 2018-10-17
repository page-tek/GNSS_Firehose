#!/usr/bin/python
'''Simple udp socket comms'''

import time 
import socket
import sys

UDP_IP = "192.168.20.45"
UDP_PORT = 0x88b6

STREAM_ON = '\x01\x02\x03\x04\x05\x08\x01'
STREAM_OFF = '\x01\x02\x03\x04\x05\x08\x00'

 
# Datagram (udp) socket
try :
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    print 'Socket created'
except socket.error, msg :
    print 'Failed to create socket. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
    sys.exit()
 
 
# Bind socket to local host and port
try:
    s.bind(('', UDP_PORT))
except socket.error , msg:
    print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
    sys.exit()
     
print 'Socket bind complete'
s.settimeout(1)
s.sendto(STREAM_ON, (UDP_IP, UDP_PORT))
data = s.recv(64)
if len(data):
  print " ".join(hex(ord(n)) for n in data)
time.sleep(1)
s.sendto(STREAM_OFF, (UDP_IP, UDP_PORT))
data = s.recv(64)
if len(data):
  print " ".join(hex(ord(n)) for n in data)    
s.close()
