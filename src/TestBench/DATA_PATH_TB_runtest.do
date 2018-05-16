setactivelib -work
#Compiling UUT module design files

comp -include "$dsn\src\TestBench\DATA_PATH_TB.v"
asim +access +r DATA_PATH_tb

wave
wave -noreg SCLR
wave -noreg INC
wave -noreg LOAD
wave -noreg SYS_CLK
wave -noreg OUT_REG

run

#End simulation macro
