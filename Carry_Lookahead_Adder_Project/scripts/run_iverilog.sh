#!/bin/bash
iverilog -g2012 -o carry_lookahead_sim.out -f filelist.f
vvp carry_lookahead_sim.out
