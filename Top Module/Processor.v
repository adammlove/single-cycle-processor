module processor();

    // clock
    reg clk;

    // wires
    wire alu_zero, alu_ovr;
    wire [31:0] PC_address, PC_next, PC_add4, instruction, reg_data_in, data_mem_out;
    wire [63:0] PC_addimm, imm_out, ALU_val_in, ALU_out, reg_out1, reg_out2;

    // control outputs
    wire branch, memread, memtoreg, memwrite, alusrc, regwrite;
    wire [2:0] alusel1, alusel2;

    // program counter
    programcounter PC(PC_next, clk, PC_address);

    // adders
    thirtytwobitadder add1(PC_address, 32'h00000004, 1'b0, , PC_add4);
    sixtyfourbitadder add2({32'h00000000, PC_address}, imm_out << 1, , , PC_addimm);

    // registers
    allregisters regs(regwrite, clk, instruction[19:15], instruction[24:20], instruction[11:7], reg_data_in, reg_out1, reg_out2);

    // immediate generator
    immediate_generator immgen(instruction, imm_out);

    // ALU
    ALU alu(reg_out1, ALU_val_in, alusel2, ALU_out, alu_zero, alu_ovr);

    // control modules
    control control(instruction, branch, memread, memtoreg, alusel1, memwrite, alusrc, regwrite);
    ALU_control alu_control(instruction, alusel1, alusel2);

    // memory modules
    instruction_memory instmem(PC_address, instruction);
    data_mem datamem(ALU_out, clk, reg_out2, data_mem_out, memwrite, memread);

    // multiplexers
    multiplexer mux1(PC_add4, PC_addimm, branch & alu_zero, PC_next);
    multiplexer mux2(reg_out2, imm_out, alusrc, ALU_val_in);
    multiplexer mux3(ALU_out, data_mem_out, memtoreg, reg_data_in);



    // clock
    integer cycles;
    initial begin
        // define the maximum number of clock cycles the processor will complete
        for(cycles=0; cycles<30; cycles=cycles+1) begin
            clk = 0;
            #1;
            clk = 1;
            #1;
        end
    end

endmodule