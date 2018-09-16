# GNSS Firehose PCB

Created using Kicad 5, there could be issue if the design is opened in Kicad 4.

Changes made from Peter Monta's GNSS Firehose version 2.2 (April 2017) design:
- FPGA changed to Spartan6 XC6SLX16 BGA256 device, the fooprint should be compatable with larger gate devices.
- Power supply topology changes to allow the analog and digital 3V3 sections to be run off different regulators.
- Added the ability to running the frequency generation from external clock source
- Changed obsolite Broadcom MGA-68563 to BGA2800

Layout changes:
- Ground planes cover the outside PCB layers
- Slot in ground plane between TCXO and ethernet components
- more direct traces between the FPGA, Ethernet IC and Ethernet connector

![GNSS Firehose Image](https://github.com/page-tek/GNSS_Firehose/blob/master/doc/GNSS_Firehose_AP0.1.jpg)
