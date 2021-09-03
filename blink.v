
module blink;	// No need for Ports 
  reg [2:0] A;
reg [2:0] B;	// variables
  wire [2:0] sum;
wire cy;// wires 
  initial
begin
$dumpfile("dump.vcd");
$dumpvars; 
#1000 $finish; 
end
 

// Instantiate the module to be tested 
  Adder3bit uut (
.A(A),
.B(B),
.sum(sum),
.cy(cy)
);


initial begin
A = 3; B = 4; // initial block 
  #100 A = 2; B = 2;
#100 A = 5; B = 1;
#100;
end


endmodule

module FullAdder(A, B, C, Sum, Cy); 
input A,B,C;
output Sum, Cy;
assign {Cy, Sum} = A+B+C; 
endmodule


module Adder3bit(A,B,sum,cy); 
input [2:0] A,B;
output [2:0] sum; 
output cy;
wire w1,w2;
FullAdder M1 (A[0], B[0],1'b0,sum[0],w1);
 
FullAdder M2 (A[1], B[1],w1,sum[1],w2);
FullAdder M3 (A[2], B[2],w2,sum[2],cy);


endmodule

