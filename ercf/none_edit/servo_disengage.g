; ==== engage the servo ====
echo >{global.ercf_tmp_file} "M280 P"^global.ercf_servo_num^" S"^global.ercf_servo_disengage					;Move the servo to the disengaged position

M98 P"ercf/none_edit/execute_tmp.g"