var bowden_to_sensor = global.ercf_bowden_to_sensor + 20
var toolhead_sensor = global.toolhead_sensor_num

if sensors.gpIn[global.toolhead_sensor_num].value = 1
  M118 S"Filament still below the extruder... Trying extraction again..."
  M98 P"0:/sys/ercf/none_edit/servo_disengage.g"
  G1 E-5.00 F1200.0
  set global.ercf_unload_track = global.ercf_unload_track + 5
  G1 F2000 E{-var.bowden_to_sensor}
  set global.ercf_unload_track = global.ercf_unload_track + var.bowden_to_sensor
  G4 P100
  M400
  M98 P"0:/sys/ercf/none_edit/RETRY_EXTRACT_FROM_EXTRUDER.g"
else
  M98 P"0:/sys/ercf/none_edit/HAIR_PULLING_MOVE.g"