`timescale 1ns/1ns

module data_64(
  //input clk_a,
  //input [5:0] addr_a,
  //input [7:0] data_in_a,
  //input we_a,
  input clk_b,
  input [5:0] addr_b,
  output reg [7:0] data_out_b
);

  //reg [7:0] mem[0:63];

  //always @(posedge clk_a)
  //  if (we_a)
  //    mem[addr_a] <= data_in_a;

  always @(posedge clk_b)
    begin
      case (addr_b)
        6'd0 : data_out_b <= 8'hC8;
        6'd1 : data_out_b <= 8'h1F;
        6'd2 : data_out_b <= 8'h66;
        6'd3 : data_out_b <= 8'h23;
        6'd4 : data_out_b <= 8'hD7;
        6'd5 : data_out_b <= 8'h36;
        6'd6 : data_out_b <= 8'h00;
        6'd7 : data_out_b <= 8'h01;
        6'd8 : data_out_b <= 8'h02;
        6'd9 : data_out_b <= 8'h03;
        6'd10 : data_out_b <= 8'h04;
        6'd11 : data_out_b <= 8'h09;
        6'd12 : data_out_b <= 8'h08;
        6'd13 : data_out_b <= 8'h06;
        6'd14 : data_out_b <= 8'h00;
        6'd15 : data_out_b <= 8'h01;
        6'd16 : data_out_b <= 8'h08;
        6'd17 : data_out_b <= 8'h00;
        6'd18 : data_out_b <= 8'h06;
        6'd19 : data_out_b <= 8'h04;
        6'd20 : data_out_b <= 8'h00;
        6'd21 : data_out_b <= 8'h02;
        6'd22 : data_out_b <= 8'h00;
        6'd23 : data_out_b <= 8'h01;
        6'd24 : data_out_b <= 8'h02;
        6'd25 : data_out_b <= 8'h03;
        6'd26 : data_out_b <= 8'h04;
        6'd27 : data_out_b <= 8'h09;
        6'd28 : data_out_b <= 8'hC0;
        6'd29 : data_out_b <= 8'hA8;
        6'd30 : data_out_b <= 8'h14;
        6'd31 : data_out_b <= 8'h2D;
        6'd32 : data_out_b <= 8'hC8;
        6'd33 : data_out_b <= 8'h1F;
        6'd34 : data_out_b <= 8'h66;
        6'd35 : data_out_b <= 8'h23;
        6'd36 : data_out_b <= 8'hD7;
        6'd37 : data_out_b <= 8'h36;
        6'd38 : data_out_b <= 8'hC0;
        6'd39 : data_out_b <= 8'hA8;
        6'd40 : data_out_b <= 8'h14;
        6'd41 : data_out_b <= 8'h32;
        6'd42 : data_out_b <= 8'h00;
        6'd43 : data_out_b <= 8'h00;
        6'd44 : data_out_b <= 8'h00;
        6'd45 : data_out_b <= 8'h00;
        6'd46 : data_out_b <= 8'h00;
        6'd47 : data_out_b <= 8'h00;
        6'd48 : data_out_b <= 8'h00;
        6'd49 : data_out_b <= 8'h00;
        6'd50 : data_out_b <= 8'h00;
        6'd51 : data_out_b <= 8'h00;
        6'd52 : data_out_b <= 8'h00;
        6'd53 : data_out_b <= 8'h00;
        6'd54 : data_out_b <= 8'h00;
        6'd55 : data_out_b <= 8'h00;
        6'd56 : data_out_b <= 8'h00;
        6'd57 : data_out_b <= 8'h00;
        6'd58 : data_out_b <= 8'h00;
        6'd59 : data_out_b <= 8'h00;
        6'd60 : data_out_b <= 8'h00;
        6'd61 : data_out_b <= 8'h00;
        6'd62 : data_out_b <= 8'h00;
        6'd63 : data_out_b <= 8'h00;
      endcase
    end

//0000   c8 1f 66 23 d7 36 00 01 02 03 04 09 08 06 00 01
//0010   08 00 06 04 00 02 00 01 02 03 04 09 c0 a8 14 2d
//0020   c8 1f 66 23 d7 36 c0 a8 14 32 00 00 00 00 00 00
//0030   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
endmodule


module tb_packet_streamer;


  reg clk = 0, reset= 0;
  wire[7:0] tx_data;
  wire[1:0] tx_ctl;
  wire[15:0] packet_count;
  reg source_en = 0;
  reg streamer_enable = 0;
  reg source_packet_end;
  reg cmd_ready;
  wire [5:0] cmd_addr;
  wire [7:0] cmd_data;

  data_64 mem(clk,cmd_addr, cmd_data);

  packet_streamer dut(clk, reset, 16'h0000, source_en,
    source_packet_end, clk,tx_data,tx_ctl,packet_count,streamer_enable,
    48'h000102030409,cmd_ready,cmd_addr,cmd_data);

  always #5 clk = ~clk ;


  initial begin
    $dumpfile("my_dumpfile.vcd");
    $dumpvars(0, tb_packet_streamer);
    #10 reset = 1;
    #90 reset = 0;
    #200 cmd_ready = 1;
    #300 cmd_ready = 0;
    #5000 $finish;
  end

endmodule
