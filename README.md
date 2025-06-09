8-to-3 Encoder in Verilog

Overview

In this project, I implemented a parameterized N-bit encoder in Verilog using behavioral modeling. My goal was to create a circuit that takes an N-bit one-hot input (where exactly one bit is set to 1) and outputs a binary number representing the position of that set bit. For example, with an 8-bit input (N=8), if the input is 00001000, the output should be 011 (3 in binary), indicating the 1 is at position 3. I used the $clog2 function in Verilog to compute the output and wrote a testbench to verify the encoder’s functionality for an 8-bit input by testing one-hot inputs. I confirmed the design works as expected through simulation.

Module: encoder





What I Did: I designed an encoder that converts an N-bit one-hot input to a binary output.



Parameters:





N: Number of input bits (default: 8).



Inputs:





in[N-1:0]: N-bit input vector, expected to be one-hot (exactly one bit set to 1).



Outputs:





out[$clog2(N)-1:0]: Binary output representing the position of the set bit (MSB is position N-1).



How It Works:





I used the expression assign out = $clog2(in) to compute the position of the set bit. The $clog2 function returns the ceiling of the base-2 logarithm of the input, giving the index of the highest 1.



For example, if N=8 and in=00001000 (decimal 8), $clog2(8)=3, so out=011.



Style: Behavioral modeling with a single continuous assignment.



Note: The design assumes a one-hot input. Non-one-hot inputs may produce incorrect results since $clog2 prioritizes the MSB.

Testbench: testbench





What I Did: I created a testbench to verify the 8-to-3 encoder (N=8).



How It Works:





I defined N=8 and tested one-hot inputs where only one bit is set at a time (e.g., 00000001, 00000010, ..., 10000000).



I used a for loop to iterate through inputs in = 2^i for i from 0 to 7, setting one bit high per test case.



Each test case runs for 10ns, and I used $monitor to display the time, input (in), and output (out).



I included a header with $display to format the console output clearly.



Time Scale: I set 1ns / 1ps for precise simulation timing.



Purpose: My testbench ensures the encoder correctly maps each one-hot input to its binary position.

Files





encoder.v: Verilog module for the N-bit encoder.



testbench.v: Testbench for simulation (configured for N=8).

Circuit Diagram

Below is the circuit diagram for the 8-to-3 encoder.
![download](https://github.com/user-attachments/assets/f2acd087-5999-41bd-bd12-65ed27213cb0)


Simulation Waveform

Below is the simulation waveform, showing input in[7:0] and output out[2:0] over time.
![Screenshot 2025-06-09 192438](https://github.com/user-attachments/assets/de37dfad-2300-4b55-bd1b-d8f7d959b4d8)


Console Output

Below is the console output from my testbench simulation.
![Screenshot 2025-06-09 192422](https://github.com/user-attachments/assets/1e295d26-d77c-46d6-97d1-29a542b90725)






time | input |output



0 | 00000001 | 000



10 | 00000010 | 001



20 | 00000100 | 010



30 | 00001000 | 011



40 | 00010000 | 100



50 | 00100000 | 101



60 | 01000000 | 110



70 | 10000000 | 111
