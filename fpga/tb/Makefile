CC = iverilog

FLAGS = -Wall -Winfloop

packet_streamer:
	$(CC) $(FLAGS) -o test ../hdl/ram.v ../hdl/reset_gen.v ../hdl/crc.v /home/alan/fpga/GNSS_Firehose-alan/fpga/hdl/packet_streamer.v tb_packet_streamer.v
	vvp test
	gtkwave my_dumpfile.vcd

picorv32_soc:
	$(CC) $(FLAGS) -o test ../hdl/picorv32.v ../hdl/picorv32_soc.v tb_picorv32_soc.v
	./makehex.py ../firmware/sim.bin 16 > sim.bin
	vvp test
	gtkwave my_dumpfile.vcd

gray:
	$(CC) $(FLAGS) -o test tb_gray.v
	vvp test

quantize:
	$(CC) $(FLAGS) -o test ../hdl/quantize.v tb_quantize.v
	vvp test

clean:
	-rm test
	-rm my_dumpfile.vcd
	-rm sim.*
