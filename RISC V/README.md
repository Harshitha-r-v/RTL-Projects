# Energy Efficient RISC-V Processor Design Using Clock Gating

This repository contains a Verilog-based academic implementation of a 32-bit RISC-V processor and a clock-gated ALU design. The project demonstrates how clock gating can reduce dynamic power consumption by disabling switching activity in inactive logic blocks.

## Project Overview

RISC-V is an open-source instruction set architecture (ISA) that is widely used in processor design education, embedded systems, and computer architecture research. In this project, a 32-bit RISC-V microprocessor was designed in Verilog HDL, simulated using ModelSim, and evaluated through synthesis, timing, power, and physical design analysis.

The main optimization explored in this project is **clock gating**, applied to the Arithmetic Logic Unit (ALU) to reduce unnecessary switching activity and lower total power consumption.

## Objectives

- Design a 32-bit RISC-V microprocessor using Verilog HDL.
- Implement core processor modules including ALU, register file, control unit, instruction memory, data memory, comparator, branch logic, and multiplexers.
- Apply clock gating to reduce dynamic power consumption in the ALU.
- Simulate the design using ModelSim.
- Perform synthesis, timing, power analysis, placement, and routing.
- Compare power consumption with and without clock gating.

## Key Features

- 32-bit RISC-V style processor datapath
- Verilog RTL implementation
- ALU with and without clock gating
- Register file with 32 general-purpose registers
- Instruction and data memory modules
- Branch comparison logic
- Basic control unit
- FPGA/ASIC-oriented simulation flow
- Power comparison between baseline and clock-gated designs

## Repository Structure

```text
.
├── README.md
├── src/
│   ├── alu_no_clock_gating.v
│   ├── alu_clock_gating.v
│   ├── branch_comp.v
│   ├── control_unit.v
│   ├── data_mem.v
│   ├── instr_mem.v
│   ├── mux2.v
│   ├── reg.v
│   ├── reg_file.v
│   └── cpu_wrapper.v
└── tb/
    └── tb_alu_clock_gating.v
```

## Tools Used

- Verilog HDL
- ModelSim
- Synopsys Design Compiler
- Cadence Innovus
- Multisim / simulation tools

## Results Summary

The project compared power consumption of the RISC-V processor design with and without clock gating. Based on the project report, applying clock gating reduced total output power by approximately **25%**.

| Design | Total Power |
|---|---:|
| RISC-V without clock gating | 5375.6317 uW |
| RISC-V with clock gating | 4034.5623 uW |

## Clock Gating Concept

Clock gating reduces dynamic power by preventing unnecessary clock transitions in inactive circuit blocks. In this project, the ALU clock is enabled only when ALU activity is required. When the ALU is idle, the gated clock disables internal switching activity, reducing power consumption.

## How to Run a Basic Simulation

Using Icarus Verilog:

```bash
iverilog -o sim_alu tb/tb_alu_clock_gating.v src/alu_clock_gating.v
vvp sim_alu
```

Using ModelSim:

```tcl
vlog src/alu_clock_gating.v tb/tb_alu_clock_gating.v
vsim tb_alu_clock_gating
run -all
```

## Notes

The code in this repository is a cleaned and GitHub-ready reconstruction based on the academic project report appendix. If you have the original Verilog source files, replace the reconstructed files with the original versions before publishing the final repository.

## Authors

- Harshitha Ramesh

## License

This project is intended for academic and learning purposes. Add a license file before public release if you want others to reuse or modify the code.
