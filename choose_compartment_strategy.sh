#!/bin/sh -ex

option=$1
chosen_dir="compartment_allocations/strategy_${option}"
nolibc_src_dir="nolibc/"
asmrun_src_dir="asmrun/"

cp ${chosen_dir}/asmrun/* ${asmrun_src_dir}/
cp ${chosen_dir}/nolibc/* ${nolibc_src_dir}/