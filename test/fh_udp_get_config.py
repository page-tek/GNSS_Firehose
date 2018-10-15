#!/usr/bin/python
'''Simple udp socket comms'''
 
import socket
import sys

UDP_IP = "192.168.20.45"
UDP_PORT = 0x88b6

result = []
 
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

for n in range(256):
    s.sendto('\x01\x02\x03\x04\x0B\x00\x07\xFF'+chr(n), (UDP_IP, UDP_PORT))

    data = s.recv(64)

    result.append(ord(data[4]))

for n in range(0,256,16):
  print '\r\n%02X:' % n,
  for i in range(n,n+15):
    print '%02X' % result[i],
     
s.close()
