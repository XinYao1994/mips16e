
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Uart -dir "H:/Working/jiekou/UART/Uart/planAhead_run_1" -part xc6slx45csg484-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "H:/Working/jiekou/UART/Uart/Uart.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {H:/Working/jiekou/UART/Uart} }
set_property target_constrs_file "Uart.ucf" [current_fileset -constrset]
add_files [list {Uart.ucf}] -fileset [get_property constrset [current_run]]
link_design
