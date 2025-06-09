`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2025 19:38:06
// Design Name: 
// Module Name: priority_encoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
// Priority Encoder Module (unchanged)
// Priority Encoder Module
module priority_encoder_8(input [7:0] in, output reg [2:0] out);
    always @(*) begin
        casez(in)
        8'b1???????: out = 3'b111;
        8'b01??????: out = 3'b110;
        8'b001?????: out = 3'b101;
        8'b0001????: out = 3'b100;
        8'b00001???: out = 3'b011;
        8'b000001??: out = 3'b010;
        8'b0000001?: out = 3'b001;
        8'b00000001: out = 3'b000;
            default:     out = 3'b000;
        endcase
    end
endmodule

module testbench();
reg [7:0]in;
wire [2:0]out;
priority_encoder_8 m1(in,out);
initial begin
repeat(10)
begin
in=$random;
#10;
$display("in=%b out=%b",in,out);
end
$finish;
end
endmodule
