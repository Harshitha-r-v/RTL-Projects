#!/bin/bash
iverilog -g2012 -o bsd_adder_sim.out -f filelist.f
vvp bsd_adder_sim.out
