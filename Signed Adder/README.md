# Signed Magnitude Adder/Subtractor RTL Design

This project implements a signed magnitude adder/subtractor in Verilog HDL. The design uses a modular datapath and control approach to support signed arithmetic using selective complement logic and two's complement conversion.

---

## Project Overview

The goal of this project is to perform arithmetic on signed magnitude inputs and generate the signed result with overflow indication. The design separates the datapath modules from the control logic, making the implementation easier to understand, verify, and extend.

The design supports:

- Signed addition
- Signed subtraction
- Selective operand complementing
- Two's complement preprocessing
- Result sign generation
- Overflow flag generation
- Testbench-based functional verification

---

## Repository Structure

```text
Signed_Adder_Project_Clean/
│
├── rtl/
│   ├── new_adder.v
│   ├── new_control.v
│   ├── new_selective_one.v
│   ├── new_selective_two.v
│   ├── new_signed_magnitude.v
│   └── new_twos_complement.v
│
├── tb/
│   └── new_signed_magnitude_tb.v
│
├── scripts/
│   ├── filelist.f
│   └── run_iverilog.sh
│
├── docs/
│   └── original_files/
│       └── HDlsign_adder.rar
│
├── results/
│   ├── reports/
│   └── waveforms/
│
└── README.md
```

---

## Design Architecture

### Top Module: `new_signed_magnitude`

The top-level module connects the complete datapath:

1. Convert input magnitudes using `new_twos_complement`
2. Conditionally complement operand X using `new_selective_one`
3. Add operands using `new_adder`
4. Generate control signals using `new_control`
5. Conditionally complement final result using `new_selective_two`

---

## Module Descriptions

### `new_twos_complement.v`

Preprocesses the 3-bit magnitude input by appending a leading bit and converting it into a 4-bit two's complement style representation.

### `new_selective_one.v`

Conditionally complements the X input before the adder stage based on the `compl_x` control signal.

### `new_adder.v`

Performs 4-bit addition using:

- Operand X
- Operand Y
- Carry-in

Outputs:

- 4-bit sum
- Carry-out
- Sign bit from the MSB of the sum

### `new_control.v`

Generates control signals based on:

- Sign of X
- Sign of Y
- Add/subtract control
- Carry-out
- Adder sign output

Control outputs include:

- `c_in`
- `compl_x`
- `compl_s`
- `sign_s`
- `overflow`

### `new_selective_two.v`

Conditionally complements the sum result and outputs the final 3-bit magnitude.

### `new_signed_magnitude_tb.v`

Testbench that verifies multiple signed arithmetic cases, including:

- Positive + Positive
- Positive - Positive
- Negative - Negative
- Negative + Negative

---

## Inputs and Outputs

### Inputs

| Signal | Width | Description |
|---|---:|---|
| `x` | 3-bit | Magnitude of first operand |
| `y` | 3-bit | Magnitude of second operand |
| `sign_x` | 1-bit | Sign of first operand |
| `sign_y` | 1-bit | Sign of second operand |
| `add_sub` | 1-bit | Operation select: `0 = add`, `1 = subtract` |

### Outputs

| Signal | Width | Description |
|---|---:|---|
| `s` | 3-bit | Result magnitude |
| `sign_s` | 1-bit | Result sign |
| `overflow` | 1-bit | Overflow indicator |

---

## Example Test Cases

| Case | Operation | Description |
|---|---|---|
| Case 1 | `+1 + +1` | Positive addition |
| Case 2 | `+4 - +5` | Positive minus larger positive |
| Case 3 | `-4 - -3` | Negative subtract negative |
| Case 4 | `-3 + -2` | Negative addition |

---

## How to Run

### Using Icarus Verilog

From the `scripts/` directory:

```bash
bash run_iverilog.sh
```

Or manually:

```bash
iverilog -g2012 -o signed_adder_sim.out \
  ../rtl/new_twos_complement.v \
  ../rtl/new_selective_one.v \
  ../rtl/new_adder.v \
  ../rtl/new_control.v \
  ../rtl/new_selective_two.v \
  ../rtl/new_signed_magnitude.v \
  ../tb/new_signed_magnitude_tb.v

vvp signed_adder_sim.out
```

### Using ModelSim

```tcl
vlog rtl/*.v tb/*.v
vsim new_signed_magnitude_tb
run -all
```

---

## Tools

- Verilog HDL
- ModelSim
- Icarus Verilog
- GTKWave / waveform viewer

---

## Skills Demonstrated

- RTL design
- Signed arithmetic implementation
- Datapath and control design
- Two's complement logic
- Functional verification using testbenches
- Modular Verilog coding

---

## Notes

The original uploaded compressed project is preserved in:

```text
docs/original_files/HDlsign_adder.rar
```

The visible Verilog files are placed directly inside `rtl/` and `tb/` so recruiters and reviewers can view the code directly on GitHub.

---

## Author

Harshitha Ramesh  
M.S. Electrical and Computer Engineering  
California State University, Fresno
