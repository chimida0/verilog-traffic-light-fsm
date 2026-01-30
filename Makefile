TOP_MODULE = traffic_light
SRC = $(TOP_MODULE).v tb_$(TOP_MODULE).v
OUT = simulation.vvp

all: compile simulate view

compile:
	iverilog -o $(OUT) $(SRC)

simulate:
	vvp $(OUT)

view:
	gtkwave dump.vcd
