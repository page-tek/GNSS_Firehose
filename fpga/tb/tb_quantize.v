
module tb_quantizer;
// Inputs  
reg clk;
reg [7:0] x;
reg [7:0] offset;
reg [9:0] random;
// Outputs  
wire [1:0] y;  
integer i;
// Instantiate the Unit Under Test (UUT)  
quantize uut ( clk, x, offset, random, y);

initial begin  
// Initialize Inputs  
clk = 0;
offset = 0;
random = 0;
// Wait 100 ns for global reset to finish  
#100;  
// Add stimulus here  
for (i = -128; i < 128; i=i+1) begin
  x=i;  
  #100;
  clk = 1;
  #100;
  $display("%b,%b",x,y);
  clk = 0;
  #100;
end
end  
 
endmodule
