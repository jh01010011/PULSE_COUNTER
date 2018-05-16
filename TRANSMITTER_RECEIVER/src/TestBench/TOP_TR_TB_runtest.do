setactivelib -work
#Compiling UUT module design files

comp -include "$dsn\src\TestBench\TOP_TR_TB.v"
asim +access +r TOP_TR_tb

wave
wave -noreg PULSE_A
wave -noreg PULSE_B
wave -noreg SYS_CLK
wave -noreg A_RESET
wave -noreg OUT_REG

run

#End simulation macro
