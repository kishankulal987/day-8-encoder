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



8-to-3 Priority Encoder in Verilog
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------Overview

In this project, I implemented an 8-to-3 priority encoder in Verilog using behavioral modeling. My goal was to create a circuit that takes an 8-bit input and outputs a 3-bit binary number representing the position of the highest-priority set bit, where the most significant bit (MSB, bit 7) has the highest priority. For example, if the input is 10000000, the output is 111 (7 in binary), and if the input is 00100000, the output is 101 (5 in binary). I used a casez statement to implement the priority logic and wrote a testbench to verify the encoder’s functionality with random inputs. I simulated the design to confirm it works correctly.

Module: priority_encoder_8





What I Did: I designed an 8-to-3 priority encoder to process an 8-bit input and produce a 3-bit output.



Inputs:





in[7:0]: 8-bit input vector where zero, one, or more bits may be set.



Outputs:





out[2:0]: 3-bit binary output indicating the position of the highest-priority set bit (bit 7 is position 7, bit 0 is position 0).



How It Works:





I used a casez statement inside an always @(*) block to check the input bits from MSB (bit 7) to LSB (bit 0).



The casez patterns (e.g., 8'b1???????, 8'b01??????) prioritize the MSB by checking for a 1 in higher positions first, with ? treating remaining bits as “don’t care.”



For example:





If in=1??????? (bit 7 is 1), out=111 (7).



If in=01?????? (bit 7 is 0, bit 6 is 1), out=110 (6).



If in=00000000, the default case sets out=000.



This ensures the highest set bit determines the output, regardless of lower bits.



Style: Behavioral modeling with a casez statement.

Testbench: testbench





What I Did: I created a testbench to verify the 8-to-3 priority encoder.



How It Works:





I defined an 8-bit input in and a 3-bit output out.



I used a repeat(10) loop to generate 10 random inputs using $random, testing various combinations of set and unset bits.



Each test case runs for 10ns, and I used $display to print the input (in) and output (out) for each iteration.



The random inputs test cases like single-bit sets, multiple-bit sets, and possibly all zeros.



Time Scale: I set 1ns / 1ps for precise simulation timing.



Purpose: My testbench confirms the encoder correctly identifies the highest-priority set bit for diverse input patterns.

Files





priority_encoder_8.v: Verilog module for the 8-to-3 priority encoder.



testbench.v: Testbench for simulation.

Circuit Diagram

Below is the circuit diagram for the 8-to-3 priority encoder.
![sddefault](https://github.com/user-attachments/assets/7db1782e-46aa-47e6-9b4c-915515223a35)


Simulation Waveform

Below is the simulation waveform, showing input in[7:0] and output out[2:0] over time.


![Screenshot 2025-06-09 201417](https://github.com/user-attachments/assets/3828a7c9-20d1-4f0b-b48c-511b76bd8911)


Console Output

Below is the console output from my testbench simulation.


![Screenshot 2025-06-09 201432](https://github.com/user-attachments/assets/d3702512-f54d-406c-b5d0-4c6a8a8d8067)






in=10000000 out=111



in=00101000 out=101



in=00000010 out=001



in=11000000 out=111



in=00000100 out=010



in=00000000 out=000



... (continues for 10 random inputs)
