# Carry Lookahead Adder RTL Design

This project implements a hierarchical Carry Lookahead Adder (CLA) using Verilog HDL. The design is organized using reusable 4-bit and 16-bit CLA blocks and extends the architecture to a wider carry-lookahead structure.

---

## Project Overview

Carry Lookahead Adders improve addition speed by reducing carry propagation delay compared with ripple-carry adders. Instead of waiting for each carry to ripple through every bit position, the CLA computes carry signals using generate and propagate logic.

This project demonstrates:

- Hierarchical RTL design
- 4-bit CLA building block
- 16-bit CLA module
- Wider CLA integration
- Carry generate and propagate logic
- Functional testbench simulation
- RTL schematic/view documentation

---

## Repository Structure

```text
Carry_Lookahead_Adder_Project/
├── rtl/
│   ├── carryLook.v
│   ├── fourBitAdder.v
│   ├── fourBitGenerator.v
│   └── sixteenCLA.v
├── tb/
│   └── carryLooktb.v
├── scripts/
│   ├── filelist.f
│   └── run_iverilog.sh
├── docs/
│   ├── rtl_view/
│   │   └── RTL_view.pdf
│   └── demo/
│       └── CLA_adder_demo.mp4
├── results/
│   ├── reports/
│   └── waveforms/
└── README.md
```

---

## Design Architecture

The design uses a hierarchical CLA structure.

### Main Modules

| Module | Description |
|---|---|
| `fourBitAdder.v` | 4-bit adder logic |
| `fourBitGenerator.v` | Generate/propagate carry logic |
| `sixteenCLA.v` | 16-bit CLA block |
| `carryLook.v` | Top-level carry lookahead design |
| `carryLooktb.v` | Functional simulation testbench |

---

## RTL Structure

The top-level design uses multiple `sixteenCLA` blocks and a `fourBitGenerator` block for higher-level carry generation. The RTL view shows four 16-bit CLA blocks connected together to form a wider adder structure, with generate/propagate outputs used for carry computation across blocks.

---

## Key Concepts

- Carry Lookahead Addition
- Generate and Propagate Signals
- Hierarchical RTL Design
- Fast Arithmetic Circuit Design
- Modular Verilog Implementation
- Functional Verification using Testbench

---

## How to Run

### ModelSim

```tcl
vlog rtl/*.v tb/*.v
vsim carryLooktb
run -all
```

### Icarus Verilog

From the `scripts/` directory:

```bash
bash run_iverilog.sh
```

Or manually:

```bash
iverilog -g2012 -o carry_lookahead_sim.out -f scripts/filelist.f
vvp carry_lookahead_sim.out
```

---

## Tools Used

- Verilog HDL
- ModelSim / HDL simulation
- RTL Viewer
- FPGA/EDA synthesis environment

---

## Skills Demonstrated

- RTL design using Verilog
- Arithmetic circuit design
- Hierarchical hardware architecture
- Carry lookahead logic
- Testbench development
- Waveform verification
- RTL schematic interpretation

---

## Notes

The included RTL view PDF documents the synthesized/RTL hierarchy of the carry-lookahead design. The demo video is stored under `docs/demo/`.

---

## Author

Harshitha Ramesh  
M.S. Electrical and Computer Engineering  
California State University, Fresno
