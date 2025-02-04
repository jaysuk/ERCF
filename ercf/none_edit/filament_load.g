var pulse_count = 0
set global.ercf_pulse_count = 0
set var.pulse_count = global.ercf_pulse_count
echo >{global.ercf_tmp_file} "G92 " ^ global.ercf_extruder_axis ^ "0"
echo >>{global.ercf_tmp_file} "G1 F" ^ global.ercf_extruder_slow_speed ^ " " ^ global.ercf_extruder_axis ^ "50"
echo >>{global.ercf_tmp_file} "M400"
G91
M98 P"ercf/lib/execute-tmp.g"

if global.ercf_pulse_count - var.pulse_count < 3 ; filter false pulse
  echo >{global.ercf_tmp_file} "M84 " ^ global.ercf_extruder_axis
  M98 P"ercf/none_edit/execute-tmp.g"
  M98 P"ercf/none_edit/disengage.g"
  G90
  var errmsg = "No filament detected during selector load: T" ^ global.ercf_selector_pos
  if job.duration != "null"
    echo var.errmsg
    M291 P{var.errmsg} R"Load Filament" S1 T0
    M98 R1
    M226
  else
    abort var.errmsg
	
echo >{global.ercf_tmp_file} "var extrusion_amount = 0"																				;Track the amount of filament extruded
echo >>{global.ercf_tmp_file} "var extrusion_amount_tool = 0"																		;Track the amount of filament extruded
echo >>{global.ercf_tmp_file} "G92 "^global.ercf_extruder_axis^"0"																	;Zero the extruder axis
echo >>{global.ercf_tmp_file} "G91"																									;Set the movement to relative
echo >>{global.ercf_tmp_file} "G1 F"^global.ercf_extruder_fast_speed^" "^ global.ercf_extruder_axis^global.ercf_bowden_length		;Move the filament into the bowden tube just high of the extruder
echo >>{global.ercf_tmp_file} "set var.extrusion_amount = var.extrusion_amount+"^global.ercf_bowden_length							;Track current extrusion amount
echo >>{global.ercf_tmp_file} "if job.duration = "^"null"																	;Do different process for no printing
echo >>{global.ercf_tmp_file} "  M302 P1"																							;Allow cold extrusion
echo >>{global.ercf_tmp_file} "set global.ercf_pulse_count = 0"
echo >>{global.ercf_tmp_file} "M400"
echo >>{global.ercf_tmp_file} "if global.ercf_tool_filament_known = 0"
echo >>{global.ercf_tmp_file} "  while sensors.gpIn["^global.toolhead_sensor_num^"].value = 0"										;Whilst the toolhead sensor is 0
echo >>{global.ercf_tmp_file} "    G1 F"^global.ercf_extruder_load_speed^" "^ global.ercf_extruder_axis^"1 "^"E1"					;Move the filament forwards 1mm
echo >>{global.ercf_tmp_file} "    set var.extrusion_amount_tool = var.extrusion_amount_tool+1"														;Track current extrusion amount
echo >>{global.ercf_tmp_file} "    M400"
echo >>{global.ercf_tmp_file} "else"
echo >>{global.ercf_tmp_file} "  G1 F"^global.ercf_extruder_load_speed^" "^global.ercf_extruder_axis^""^global.ercf_tool_filament_known^" E"^global.ercf_tool_filament_known
echo >>{global.ercf_tmp_file} "  set var.extrusion_amount_tool = "^global.ercf_tool_filament_known
echo >>{global.ercf_tmp_file} "  while sensors.gpIn["^global.toolhead_sensor_num^"].value = 0"										;Whilst the toolhead sensor is 0
echo >>{global.ercf_tmp_file} "    G1 F"^global.ercf_extruder_load_speed^" "^ global.ercf_extruder_axis^"1 "^"E1"					;Move the filament forwards 1mm
echo >>{global.ercf_tmp_file} "    set var.extrusion_amount_tool = var.extrusion_amount_tool+1"														;Track current extrusion amount
echo >>{global.ercf_tmp_file} "    M400"
echo >>{global.ercf_tmp_file} "if sensors.gpIn["^global.toolhead_sensor_num^"].value = 1"											;When the toolhead sensor detects filament
echo >>{global.ercf_tmp_file} "  if job.duration = "^"null"	
echo >>{global.ercf_tmp_file} "    M302 P0"																							;Disallow cold extrusion
echo >>{global.ercf_tmp_file} "  M280 P"^global.ercf_servo_num^" S"^global.ercf_servo_disengage									;Disengage the servo
echo >>{global.ercf_tmp_file} "  set var.extrusion_amount = var.extrusion_amount+var.extrusion_amount_tool"						;Track current extrusion amount
echo >>{global.ercf_tmp_file} "M400"
echo >>{global.ercf_tmp_file} "G90"																								;Set movement back to absolute
echo >>{global.ercf_tmp_file} "if job.duration = "^"null"																		;Do different process for no printing
echo >>{global.ercf_tmp_file} "  M568 A2 S"^global.standard_print_temperature															;Set the extrusion temperature
echo >>{global.ercf_tmp_file} "  M116"																								;Wait for temperatures
echo >>{global.ercf_tmp_file} "G1 F"^global.printer_extrude_speed^" E"^global.ercf_extruder_sensor_to_nozzle						;Extrude to heatblock
echo >>{global.ercf_tmp_file} "set var.extrusion_amount = var.extrusion_amount+"^global.ercf_extruder_sensor_to_nozzle			;Save the total amount of filament loaded
echo >>{global.ercf_tmp_file} "set global.ercf_total_filament_loaded = var.extrusion_amount"										;Save the total amount of filament loaded
echo >>{global.ercf_tmp_file} "set global.ercf_tool_filament_loaded = var.extrusion_amount_tool"									;Save the amount of filament loaded in the tool
echo >>{global.ercf_tmp_file} "if job.duration = "^"null"																		;Do different process for no printing
echo >>{global.ercf_tmp_file} "  M568 A0"
echo >>{global.ercf_tmp_file} "set global.ercf_tool_filament_known = global.ercf_tool_filament_loaded - 5"

M98 P"ercf/none_edit/execute_tmp.g"