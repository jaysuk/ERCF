echo >{global.ercf_tmp_file} "G1 F"^global.ercf_extruder_load_speed^" "^global.ercf_extruder_axis^"{-("^global.ercf_total_filament_loaded^"-"^global.ercf_unload_track^"-40)}"
M98 P"ercf/none_edit/execute_tmp.g"

echo >{global.ercf_tmp_file} "G1 F" ^ global.ercf_extruder_slow_speed ^ " " ^ global.ercf_extruder_axis ^ "-20"
echo >>{global.ercf_tmp_file} "M400"
M98 P"ercf/none_edit/execute_tmp.g"

set global.ercf_pulse_count = 0

echo >{global.ercf_tmp_file} "G1 F" ^ global.ercf_extruder_slow_speed ^ " " ^ global.ercf_extruder_axis ^ "-10"
echo >>{global.ercf_tmp_file} "M400"
M98 P"ercf/none_edit/execute_tmp.g"

while global.ercf_pulse_count != 0 ; filter false pulse
  set global.ercf_pulse_count = 0
  M98 P"ercf/none_edit/execute_tmp.g"