create_clock -name VCLK -period 10.0 -waveform {0 5.0}

set_input_delay  1.0 -clock [get_clocks VCLK] [get_ports IN1]
set_output_delay 2.0 -clock [get_clocks VCLK] [get_ports OUT1]