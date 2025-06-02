# Single-Purpose Processor

This project implements a **simple computer architecture** in Verilog HDL designed as a single-purpose processor. It includes key components such as registers, an ALU, memory, control logic, and I/O modules, all integrated to demonstrate basic instruction execution and data processing.

---

## Project Components

### Register Modules
- `AC_reg_team1.v` – Accumulator Register  
- `AR_reg_team1.v` – Address Register  
- `DR_reg_team1.v` – Data Register  
- `IR_reg_team1.v` – Instruction Register  
- `PC_reg_team1.v` – Program Counter  
- `TR_reg_team1.v` – Temporary Register  
- `INPR_reg_team1.v` – Input Register  
- `OUTR_reg_team1.v` – Output Register  

### Functional Units
- `adder_and_logic_unit_team1.v` – Arithmetic Logic Unit (ALU)  
- `control_unit_team1.v` – Control Unit (FSM)  
- `datapath_team1.v` – Datapath connections  
- `memory_team1.v` – Memory module  
- `interrupt_team1.v` – Interrupt handling  

### Support Modules
- `decoder3X8_team1.v` – 3-to-8 Decoder  
- `decoder4X16_team1.v` – 4-to-16 Decoder  
- `encoder8X3_team1.v` – 8-to-3 Encoder  
- `mux_16bit_8X1_team1.v` – 8:1 Multiplexer (16-bit)  
- `sequence_counter_team1.v` – Sequence counter  

### Top-Level Modules
- `top_module.v` – Main system integration  
- `top_module_tb.v` – Testbench for simulation  

---

## Usage Instructions

1. Use a Verilog simulator such as **ModelSim** or **Icarus Verilog** to compile and simulate the design.
2. Initialize memory using `mem_init.txt`.
3. Run the testbench (`top_module_tb.v`) to verify the processor functionality.

---

## Team

Developed by **Team 1** as part of a computer architecture project.

---

## License

This project is provided for educational purposes. Feel free to modify and extend with appropriate attribution.


