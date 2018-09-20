// 10-bit pulse-width modulator
//
// GNSS Firehose
// Copyright (c) 2012 Peter Monta <pmonta@gmail.com>

//module pwm(
//  input clk,
//  input [9:0] v,
//  output reg x
//);
//
//  reg [9:0] c;
//
//  always @(posedge clk) begin
//    c <= c + 1;
//    x <= (v>c);
//  end
//endmodule

//First Order Sigma Delta
module pwm(
  input clk,
  input [9:0] v,
  output x
);
  
  reg [10:0] acc;

  always @(posedge clk) acc <= acc[9:0] + v;

  assign x = acc[10];

endmodule
