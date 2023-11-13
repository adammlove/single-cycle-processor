# single-cycle-processor
This is the final project in my advanced processors class at Temple University (ECE 4612). The project is to build and simulate a single-cycle MIPS processor in verilog. The block diagram we are tasked with building is shown below:
# The Processor
![image](https://github.com/adammlove/single-cycle-processor/assets/61215471/02170cc4-ab64-4cc2-8c5b-ce9184f14a29)
Our processor design must be able to execute load, store, R-type (addition, subtraction, division, multiplication, AND, OR), and branch (BEQ) instructions. The adder module is the only module that MUST be built using a structural model, the rest of the modules are built using a behavioral model. The division and multiplication modules within the ALU are built using algorithms we learned in class, rather than having the compiler handle the multiplication or division.
