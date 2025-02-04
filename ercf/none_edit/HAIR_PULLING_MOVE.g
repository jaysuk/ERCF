G92 E0
if global.ercf_hair_puller_move = 1
  M98 P"0:/sys/ercf/none_edit/servo_engage.g"
  echo >{global.ercf_tmp_file} "G92 "^global.ercf_extruder_axis^"0"
  echo >>{global.ercf_tmp_file} "G1 F1500 "^global.ercf_extruder_axis^global.ercf_unload_move_before_hair_pulling
  echo >>{global.ercf_tmp_file} "G92 "^global.ercf_extruder_axis^"0"
  echo >>{global.ercf_tmp_file} "G1 F1500 "^global.ercf_extruder_axis^"-10"
  M98 P"ercf/none_edit/execute_tmp.g"
else
  M98 P"0:/sys/ercf/none_edit/servo_engage.g"
  echo >{global.ercf_tmp_file} "G92 "^global.ercf_extruder_axis^"0"
  echo >>{global.ercf_tmp_file} "G1 F1500 "^global.ercf_extruder_axis^"-30"
  M98 P"ercf/none_edit/execute_tmp.g"