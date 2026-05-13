#!/bin/bash
# Simple Icarus Verilog simulation script
# Run from the scripts/ directory:
#   bash run_iverilog.sh

iverilog -g2012 -o signed_adder_sim.out -f filelist.f
vvp signed_adder_sim.out
