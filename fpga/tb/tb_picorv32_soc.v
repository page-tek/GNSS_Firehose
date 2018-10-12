`timescale 1ns/1ns

module tb_picorv32_soc;

reg clk = 0;
reg reset = 1;
wire[7:0] port_id;
wire write_strobe;
wire[7:0] out_port;
wire read_strobe;
reg[7:0] in_port = 8'h55;

integer   i;
reg [31:0] data [2048];

picorv32_soc dut(clk, reset, port_id, write_strobe, out_port, read_strobe, in_port);

  always #15 clk = ~clk ;
  
  initial begin
    $dumpfile("my_dumpfile.vcd");
    $dumpvars(0, tb_picorv32_soc);

    $readmemh("sim.hex", data);
    for(i=0; i<16; i=i+1) 
      $display("%d:%h",i,data[i]);
    for(i=0; i<16; i=i+1)
      begin
        dut._ram_2k_32._bram0.mem[i] = data[i][7:0];
        dut._ram_2k_32._bram1.mem[i] = data[i][15:8];
        dut._ram_2k_32._bram2.mem[i] = data[i][23:16];
        dut._ram_2k_32._bram3.mem[i] = data[i][31:24];
      end

    #10 reset = 1;
    #90 reset = 0;
    #10000 $finish;
  end

endmodule