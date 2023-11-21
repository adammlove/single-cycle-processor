# single-cycle-processor
This is the final project in my advanced processors class at Temple University (ECE 4612). The project is to build and simulate a single-cycle MIPS processor in verilog. The block diagram we are tasked with building is shown below:
# The Processor
![image](https://github.com/adammlove/single-cycle-processor/assets/61215471/02170cc4-ab64-4cc2-8c5b-ce9184f14a29)

The processor design must be able to execute load, store, R-type (addition, subtraction, division, multiplication, AND, OR), and branch (BEQ) instructions. The adder module is the only module that MUST be built using a structural model, the rest of the modules are built using a behavioral model. The division and multiplication modules within the ALU are built using algorithms we learned in class, rather than having the compiler handle the multiplication or division.
# Programming the Processor
The program data is stored in the instruction memory folder, saved to a file called "program.txt". Each instruction must be programmed by typing the whole 32-bit binary instruction, separated by some type of whitespace. The program that is tested for the advanced processors class is ((a\*b + c\*d)+e)/f. Each value (a, b, c, d, e, and f) are all values that are pre-stored in data memory. Their values are (1000, -200, 300, 700, 100, and 3) respectively. Computing this equation using these values should result in the decimal value 3366, or the hex value 0xD26. The 12 instructions implemented so far are add, sub, mult, div, and, or, addi, ori, andi, lw, sw, and BEQ.
