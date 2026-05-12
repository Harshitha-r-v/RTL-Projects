# Pipelined RISC-V Vector Floating-Point Unit

This project presents a Verilog-based RISC-V microarchitecture study focused on a pipelined Vector Floating-Point Unit (FPU) for improved computational throughput, floating-point arithmetic support, and scalable processor design.

The project was developed as part of **ECE-274: Advanced Computer Architecture** at California State University, Fresno.

---

## Project Overview

The goal of this project is to explore how a RISC-V processor can be enhanced using a custom Floating-Point Unit (FPU) and pipelined execution concepts. The design focuses on arithmetic processing, control logic, datapath components, vector-style operation grouping, and verification using Verilog simulation.

The project includes RTL modules for common processor blocks such as:

- Arithmetic Logic Unit (ALU)
- Control Unit
- ALU Control Unit
- Comparator
- Divider
- Multiplier
- Register File
- Data Memory
- Instruction Memory
- Shifter
- Floating-point style operation blocks:
  - ADDMUL
  - DIVSQRT
  - NONCOMP
  - CONV

---

## Key Concepts

- RISC-V microarchitecture
- Pipelined processor design
- Vector Floating-Point Unit concepts
- IEEE 754 floating-point arithmetic concepts
- Arithmetic and non-computational operation grouping
- Control signal generation
- Functional verification using Verilog testbenches
- Simulation waveform analysis
- Low-power and high-performance processor design considerations

---

## Repository Structure

```text
RISC_V_Vector_FPU_Project/
│
├── rtl/
│   ├── alu.v
│   ├── control_unit.v
│   ├── alu_control_unit.v
│   ├── comparator.v
│   ├── divider.v
│   ├── multiplier.v
│   ├── register_file.v
│   ├── data_memory.v
│   ├── instruction_memory.v
│   ├── shifter.v
│   ├── addmul.v
│   ├── divsqrt.v
│   ├── noncomp.v
│   ├── conv.v
│   └── fpu_top.v
│
├── tb/
│   ├── alu_tb.v
│   ├── control_unit_tb.v
│   ├── alu_control_unit_tb.v
│   ├── comparator_tb.v
│   ├── addmul_tb.v
│   ├── divsqrt_tb.v
│   ├── noncomp_tb.v
│   ├── conv_tb.v
│   └── fpu_top_tb.v
│
├── results/
│   ├── waveforms/
│   └── reports/
│
├── docs/
│
└── README.md
```

---

## Design Description

### RISC-V Microarchitecture

The project studies the structure of a RISC-V processor including instruction fetch, decode, execution, memory access, and write-back concepts. The processor datapath is supported by arithmetic, memory, register, control, comparison, shift, multiply, and divide units.

---

### Floating-Point Unit Operation Groups

The proposed FPU-style structure is organized into multiple operation groups:

| Module | Function |
|---|---|
| ADDMUL | Add, subtract, multiply, and fused multiply-add style operations |
| DIVSQRT | Division and square-root style operations |
| NONCOMP | Comparisons and non-computational operations |
| CONV | Float/integer-style conversion operations |

This modular grouping follows the idea of operation selection, result arbitration, and result packing used in vector FPU architectures.

---

## RTL Modules

### ALU
Performs basic arithmetic and logic operations:

- ADD
- SUB
- AND
- OR
- XOR

### Control Unit
Generates control signals based on instruction opcode fields.

### ALU Control Unit
Decodes opcode, funct3, and funct7 fields to generate ALU operation control signals.

### Comparator
Evaluates equality and relational comparison conditions.

### Divider
Implements unsigned integer division with divide-by-zero protection.

### Multiplier
Implements 32-bit multiplication.

### Register File
Implements 32 general-purpose 32-bit registers.

### Data Memory
Implements simple word-addressable data storage.

### Instruction Memory
Implements a small ROM-style instruction memory.

### Shifter
Supports logical left shift, logical right shift, and arithmetic right shift.

### ADDMUL
Implements arithmetic operation selection for add, subtract, multiply, and multiply-add style operations.

### DIVSQRT
Implements division and integer square-root style behavior.

### NONCOMP
Implements comparison operations such as equal, not equal, less-than, and greater-than.

### CONV
Implements basic integer/floating-style conversion placeholder logic for architectural exploration.

---

## Tools Used

- Verilog HDL
- ModelSim
- Vivado
- Synopsys Design Compiler
- Cadence tools

---

## How to Run Simulation

Example using ModelSim:

```bash
vlog rtl/*.v tb/alu_tb.v
vsim alu_tb
run -all
```

For the FPU top-level testbench:

```bash
vlog rtl/*.v tb/fpu_top_tb.v
vsim fpu_top_tb
run -all
```

---

## Learning Outcomes

This project demonstrates:

- RTL modeling of processor datapath components
- RISC-V control and execution concepts
- Pipelined FPU architecture understanding
- Floating-point operation grouping
- Verilog simulation and testbench development
- Functional verification using waveform inspection
- Hardware architecture design for performance-oriented computing

---

## Notes

This repository contains a clean reconstruction of the RTL modules based on the technical report. Some report content describes architecture-level concepts and proposed FPU structure rather than full production-ready IEEE-754 implementation. The provided RTL is intended as a simulation-friendly academic implementation suitable for portfolio demonstration and further extension.

---

## Author

Harshitha Ramesh  
M.S. Electrical and Computer Engineering  
California State University, Fresno
