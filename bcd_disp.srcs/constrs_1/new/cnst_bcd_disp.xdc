# Seven segment cathodes (shared)
set_property PACKAGE_PIN W7 [get_ports {dis_o[0]}]  ;# CA
set_property PACKAGE_PIN W6 [get_ports {dis_o[1]}]  ;# CB
set_property PACKAGE_PIN U8 [get_ports {dis_o[2]}]  ;# CC
set_property PACKAGE_PIN V8 [get_ports {dis_o[3]}]  ;# CD
set_property PACKAGE_PIN U5 [get_ports {dis_o[4]}]  ;# CE
set_property PACKAGE_PIN V5 [get_ports {dis_o[5]}]  ;# CF
set_property PACKAGE_PIN U7 [get_ports {dis_o[6]}]  ;# CG
set_property IOSTANDARD LVCMOS33 [get_ports {dis_o[*]}]

# Anodes (active low, one per digit)
set_property PACKAGE_PIN U2 [get_ports {an_o[0]}]
set_property PACKAGE_PIN U4 [get_ports {an_o[1]}]
set_property PACKAGE_PIN V4 [get_ports {an_o[2]}]
set_property PACKAGE_PIN W4 [get_ports {an_o[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an_o[*]}]


set_property PACKAGE_PIN V17 [get_ports {bcd0_i[0]}]
set_property PACKAGE_PIN V16 [get_ports {bcd0_i[1]}]
set_property PACKAGE_PIN W16 [get_ports {bcd0_i[2]}]
set_property PACKAGE_PIN W17 [get_ports {bcd0_i[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {bcd0_i[*]}]

set_property PACKAGE_PIN W15 [get_ports {bcd1_i[0]}]					
set_property PACKAGE_PIN V15 [get_ports {bcd1_i[1]}]					
set_property PACKAGE_PIN W14 [get_ports {bcd1_i[2]}]					
set_property PACKAGE_PIN W13 [get_ports {bcd1_i[3]}]	
set_property IOSTANDARD LVCMOS33 [get_ports {bcd1_i[*]}]
				
set_property PACKAGE_PIN V2 [get_ports {bcd2_i[0]}]					
set_property PACKAGE_PIN T3 [get_ports {bcd2_i[1]}]					
set_property PACKAGE_PIN T2 [get_ports {bcd2_i[2]}]					
set_property PACKAGE_PIN R3 [get_ports {bcd2_i[3]}]	
set_property IOSTANDARD LVCMOS33 [get_ports {bcd2_i[*]}]
				
set_property PACKAGE_PIN W2 [get_ports {bcd3_i[0]}]					
set_property PACKAGE_PIN U1 [get_ports {bcd3_i[1]}]					
set_property PACKAGE_PIN T1 [get_ports {bcd3_i[2]}]					
set_property PACKAGE_PIN R2 [get_ports {bcd3_i[3]}]	
set_property IOSTANDARD LVCMOS33 [get_ports {bcd3_i[*]}]

# Clock
set_property PACKAGE_PIN W5 [get_ports clk_i]
set_property IOSTANDARD LVCMOS33 [get_ports clk_i]