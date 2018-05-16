setactivelib -work
#Compiling UUT module design files

comp -include "$dsn\src\TestBench\TOP_HP_TB.v"
asim +access +r TOP_HP_tb

wave
wave -noreg PULSE
wave -noreg SYS_CLK
wave -noreg A_RESET
wave -noreg OUT_REG

run

#End simulation macro
