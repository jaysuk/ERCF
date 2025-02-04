if sensors.gpIn["^global.toolhead_sensor_num^"].value = 1
  M118 S"Filament is stuck below the extruder..."
  M118 S"Calling ERCF_PAUSE"
  M98 P"0:/sys/ercf/none_edit/PAUSE.g"
else
  M98 P"0:/sys/ercf/none_edit/HAIR_PULLING_MOVE.g"