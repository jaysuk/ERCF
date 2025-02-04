var bowden_to_sensor = global.ercf_bowden_to_sensor + 20
set global.ercf_unload_track = 0

if job.duration = null
  M568 A2 S{global.ercf_min_temp_extruder}
  M116
M118 S"Forming filament tip and Unloading Filament..."
G92 V0
G91
M98 P"0:/sys/ercf/none_edit/FORM_TIP_STANDALONE.g"
G1 E-10 F1200
set global.ercf_unload_track = global.ercf_unload_track - 10
G1 E{-(global.ercf_extruder_sensor_to_nozzle - 10)} F2000
set global.ercf_unload_track = global.ercf_unload_track + global.ercf_extruder_sensor_to_nozzle - 10
M98 P"0:/sys/ercf/none_edit/servo_engage.g"
echo >{global.ercf_tmp_file} "G1 F2000 E-"^var.bowden_to_sensor^" "^global.ercf_extruder_axis^"-"^var.bowden_to_sensor 
M98 P"ercf/none_edit/execute_tmp.g"
set global.ercf_unload_track = global.ercf_unload_track + var.bowden_to_sensor
G4 P100
M98 P"0:/sys/ercf/none_edit/EXTRACT_FROM_EXTRUDER.g"
M98 P"0:/sys/ercf/none_edit/final_unload.g"
M118 S"Filament Removed"
M98 P"0:/sys/ercf/none_edit/servo_disengage.g"
M400
G90