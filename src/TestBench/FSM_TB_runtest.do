setactivelib -work
#Compiling UUT module design files

comp -include "$dsn\src\TestBench\FSM_TB.v"
asim +access +r FSM_tb

wave
wave -noreg PULSE
wave -noreg SYS_CLK
wave -noreg A_RESET
wave -noreg INC
wave -noreg SCLR
wave -noreg LOAD

run

#End simulation macro
