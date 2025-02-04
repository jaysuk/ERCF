; ==== configure the selector ====
echo >{global.ercf_tmp_file} "M569 P"^global.ercf_selector_driver^" S"^global.ercf_selector_driver_direction
echo >>{global.ercf_tmp_file} "M584 "^global.ercf_selector_axis^global.ercf_selector_driver
echo >>{global.ercf_tmp_file} "M350 "^global.ercf_selector_axis^"16"
echo >>{global.ercf_tmp_file} "M92 "^global.ercf_selector_axis^global.ercf_selector_steps
echo >>{global.ercf_tmp_file} "M201 "^global.ercf_selector_axis^400
echo >>{global.ercf_tmp_file} "M203 "^global.ercf_selector_axis^12000
echo >>{global.ercf_tmp_file} "M906 "^global.ercf_selector_axis^global.ercf_selector_current
echo >>{global.ercf_tmp_file} "M208 "^global.ercf_selector_axis^global.ercf_selector_axis_min^" S1"
echo >>{global.ercf_tmp_file} "M208 "^global.ercf_selector_axis^global.ercf_selector_axis_max^" S0"
echo >>{global.ercf_tmp_file} "M574 "^global.ercf_selector_axis^"1 S1 P"""^global.ercf_selector_endstop_pin^""""

; ==== configure the extruder ====
echo >>{global.ercf_tmp_file} "M569 P"^global.ercf_extruder_axis^" S"^global.ercf_extruder_driver_direction
echo >>{global.ercf_tmp_file} "M584 "^global.ercf_extruder_axis^global.ercf_extruder_driver^"R1 S0"
echo >>{global.ercf_tmp_file} "M350 "^global.ercf_extruder_axis^"16"
echo >>{global.ercf_tmp_file} "M92 "^global.ercf_extruder_axis^global.ercf_extruder_steps
echo >>{global.ercf_tmp_file} "M201 "^global.ercf_extruder_axis^400
echo >>{global.ercf_tmp_file} "M203 "^global.ercf_extruder_axis^12000
echo >>{global.ercf_tmp_file} "M906 "^global.ercf_extruder_axis^global.ercf_extruder_current
echo >>{global.ercf_tmp_file} "M208 "^global.ercf_extruder_axis^"-9999 S1"
echo >>{global.ercf_tmp_file} "M208 "^global.ercf_extruder_axis^"9999 S0"

; ==== configure servo ====
echo >>{global.ercf_tmp_file} "M950 S"^global.ercf_servo_num^" C"""^global.ercf_servo_pin^""""

; ==== configure toolhead sensor ====
echo >>{global.ercf_tmp_file} "M950 J"^global.toolhead_sensor_num^" C"""^global.toolhead_sensor_pin^""""

; ==== pulse sensor ====
echo >>{global.ercf_tmp_file} "M950 J"^global.ercf_encoder_trigger^" C"""^global.ercf_encoder_pin^""""
echo >>{global.ercf_tmp_file} "M581 T"^global.ercf_encoder_trigger^" P"^global.ercf_encoder_trigger
echo >{"trigger" ^ global.ercf_encoder_trigger ^ ".g"} "set global.ercf_pulse_count = global.ercf_pulse_count + 1"

M98 P"ercf/none_edit/execute_tmp.g"