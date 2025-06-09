`timescale 1ns / 1ps

module encoder #(parameter N=8)(input [N-1:0]in,output [$clog2(N)-1:0]out);
assign out=$clog2(in);
endmodule

module testbench();
parameter N=8;

reg [N-1:0]in;
wire [$clog2(N)-1:0]out;
encoder e1(in,out);
initial 
begin
$display("\t\t\t\ttime |   input  |output");
$monitor($time," | %b | %b",in,out);
for(integer i=0;i<N;i=i+1)
begin
in=2**i;
#10;
end
$finish;
end
endmodule
