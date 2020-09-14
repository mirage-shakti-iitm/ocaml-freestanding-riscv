#!/bin/sh -ex

option=$1
chosen_dir="compartment_allocations/strategy_${option}"
nolibc_src_dir="nolibc"
# asmrun_src_dir="runtime"

# cp ${chosen_dir}/${asmrun_src_dir}/* ${asmrun_src_dir}/
cp ${chosen_dir}/${nolibc_src_dir}/* ${nolibc_src_dir}/