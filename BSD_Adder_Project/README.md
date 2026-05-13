# Binary Signed Digit (BSD) Adder RTL Design

This project implements and verifies a Binary Signed Digit (BSD) adder using Verilog HDL. The design demonstrates redundant signed-digit arithmetic, limited-carry addition, and functional verification using simulation waveforms.

## Project Overview

The Binary Signed Digit (BSD) number system represents each digit using signed values, commonly allowing digit values such as `-1`, `0`, and `+1`. This representation is useful in arithmetic circuits because it can reduce long carry propagation compared with conventional binary adders.

This project includes:

- BSD adder RTL design
- Limited carry adder module
- Verilog testbench
- Simulation waveform output
- Synthesis/resource reports
- Timing analyzer report
- Demo video

## Repository Structure

```text
BSD_Adder_Project/
├── rtl/
│   ├── BSD.v
│   └── limited_carry_adder.v
├── tb/
│   └── BSD_tb.v
├── scripts/
│   ├── filelist.f
│   └── run_iverilog.sh
├── results/
│   ├── reports/
│   │   ├── bsdadd-Resource_Usage_Summary.rpt
│   │   ├── bsdadd-Timing_Analyzer_Summary.rpt
│   │   └── bsdadd-Summary.rpt
│   └── waveforms/
│       ├── output_waveform.jpg
│       └── output_waveform.docx
├── docs/
│   └── demo/
│       └── HDL_prototype_2_demo.mp4
└── README.md
```

## Design Description

### BSD Adder

The BSD adder performs arithmetic on operands represented using signed digit encoding. The design uses multiple digit positions and produces a BSD-encoded output.

### Limited Carry Adder

The limited carry adder module supports the BSD addition process by limiting carry propagation between digit positions. This helps demonstrate how redundant signed-digit arithmetic can improve arithmetic performance compared with conventional ripple-style carry propagation.

## Example Verified Operation

The included waveform verifies BSD addition for:

```text
+6  = 00 01 11 00 11 00
-11 = 00 00 11 11 00 01
--------------------------------
out = 00 00 11 01 00 11
```

The output corresponds to `-5`, confirming correct signed arithmetic behavior for the tested case.

## Files Included

| Folder | File | Description |
|---|---|---|
| `rtl/` | `BSD.v` | Top-level BSD adder design |
| `rtl/` | `limited_carry_adder.v` | Limited carry adder module |
| `tb/` | `BSD_tb.v` | Functional testbench |
| `results/waveforms/` | `output_waveform.jpg` | Simulation waveform screenshot |
| `results/waveforms/` | `output_waveform.docx` | Waveform explanation |
| `results/reports/` | `*.rpt` | Resource, timing, and summary reports |

## How to Run

### ModelSim

```tcl
vlog rtl/*.v tb/*.v
vsim BSD_tb
run -all
```

### Icarus Verilog

From the `scripts/` directory:

```bash
bash run_iverilog.sh
```

## Tools Used

- Verilog HDL
- ModelSim / waveform simulation
- FPGA synthesis tools
- Timing analyzer
- Resource utilization reports

## Skills Demonstrated

- RTL design using Verilog
- Signed digit arithmetic
- Binary Signed Digit (BSD) representation
- Limited carry addition
- Functional verification using testbenches
- Waveform debugging
- Synthesis/resource/timing report analysis
- Digital arithmetic circuit design

## Author

Harshitha Ramesh  
M.S. Electrical and Computer Engineering  
California State University, Fresno
