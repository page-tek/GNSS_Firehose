module gray_to_binary(
  input clk,
  input [7:0] x,
  output reg [7:0] y
);

  reg [7:0] z;

  wire [7:0] xr = {x[0],x[1],x[2],x[3],x[4],x[5],x[6],x[7]};

  always @(xr) begin
    z[7] = xr[7];
    z[6] = xr[6]^z[7];
    z[5] = xr[5]^z[6];
    z[4] = xr[4]^z[5];
    z[3] = xr[3]^z[4];
    z[2] = xr[2]^z[3];
    z[1] = xr[1]^z[2];
    z[0] = xr[0]^z[1];
  end

  always @(posedge clk)
    y <= {~z[7],z[6:0]};

endmodule

module tb_gray;
// Inputs 
reg clk;
reg [7:0] x;  
reg [7:0] gray;
reg [7:0] rev_gray;
// Outputs  
wire [7:0] y;  
integer i;
integer j;
// Instantiate the Unit Under Test (UUT)  
gray_to_binary uut (  
clk,
rev_gray,  
y
);

initial begin  
// Initialize Inputs  
clk = 0;  
// Wait 100 ns for global reset to finish  
#100;  
// Add stimulus here  
for (j = 0; j < 256; j=j+1) begin
  x = j;
  gray[7] = x[7];
  for (i = 7; i > 0; i = i - 1)
    gray[i - 1] = x[i] ^ x[i - 1];
  
  rev_gray = {gray[0],gray[1],gray[2],gray[3],gray[4],gray[5],gray[6],gray[7]};
  #100;
  clk = 1;
  #100
  $display("%b,%b,%b",x,gray,y);
  clk = 0;
end
end  
 
endmodule
