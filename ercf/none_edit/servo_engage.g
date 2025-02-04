; ==== engage the servo ====
echo >{global.ercf_tmp_file} "M280 P"^global.ercf_servo_num^" S"^global.ercf_servo_engage						;Move the servo to the engaged position

; ==== buzz bondtech gears ====
echo >>{global.ercf_tmp_file} "G92 "^global.ercf_extruder_axis^"0"												;Set the extruder axis to 0
echo >>{global.ercf_tmp_file} "G90"																				;Set the moves to absolute
echo >>{global.ercf_tmp_file} "G1 "^global.ercf_extruder_axis^"0.5 F"^global.ercf_extruder_slow_speed			;Move the extruder forwards 0.5
echo >>{global.ercf_tmp_file} "M400"																			;Make sure the move has finished
echo >>{global.ercf_tmp_file} "G1 "^global.ercf_extruder_axis^"0.0 F"^global.ercf_extruder_slow_speed			;Move the extruder to 0.0
echo >>{global.ercf_tmp_file} "M400"																			;Make sure the move has finished
echo >>{global.ercf_tmp_file} "G1 "^global.ercf_extruder_axis^"-0.5 F"^global.ercf_extruder_slow_speed			;Move the extruder backwards 0.5
echo >>{global.ercf_tmp_file} "M400"																			;Make sure the move has finished
echo >>{global.ercf_tmp_file} "G1 "^global.ercf_extruder_axis^"0.0 F"^global.ercf_extruder_slow_speed			;Move the extruder to 0.0

M98 P"ercf/none_edit/execute_tmp.g"