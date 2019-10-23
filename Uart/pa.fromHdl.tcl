
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Uart -dir "H:/Working/jiekou/UART/Uart/planAhead_run_1" -part xc6slx45csg484-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Uart.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {Trans.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Recve.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Baud.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Uart.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top Uart $srcset
add_files [list {Uart.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx45csg484-3
