; global declarations, some relatively sane defaults included
; value overrides should go in ercf/settings.g
if !exists(global.ercf_settings_loaded)
  ;
  ; general settings
  ;
  global ercf_bowden_length = 0
  global ercf_retraction_length = 0
  global ercf_tool_number = 0
  global ercf_tool_count = 9
  global ercf_tool0_offset = 2
  global printer_extruder_driver = {move.extruders[0].driver}
  global ercf_settings_adjusted = false
  global standard_print_temperature = 0
  global printer_extrude_speed = 300
  global ercf_total_filament_loaded = 0
  global ercf_tool_filament_loaded = 0
  global ercf_retraction_adjustment_amount = 0
  global ercf_min_temp_extruder = 180
  global ercf_hair_puller_move = 0
  global ercf_unload_move_before_hair_pulling = 20
  global ercf_unload_track = 0
  global ercf_tool_filament_known = 0
  ;
  ; selector axis settings
  ;
  global ercf_selector_axis = "U"
  global ercf_selector_driver = 0.7
  global ercf_selector_driver_direction = 0
  global ercf_selector_endstop_pin = "xstop"
  global ercf_selector_current = 750
  global ercf_selector_steps = 80
  global ercf_selector_axis_min = 0
  global ercf_selector_axis_max = 115
  ;
  ; toolhead sensor
  ;
  global toolhead_sensor_pin = "zstop"
  global toolhead_sensor_num = 0
  ;
  ; filament drive settings
  ;
  global ercf_extruder_axis = "V"
  global ercf_extruder_driver = "0.8"
  global ercf_extruder_driver_direction = 0
  global ercf_extruder_current = 565
  global ercf_extruder_steps = 574.28
  global ercf_extruder_gear_diameter = 7.35
  ; calculated as gear bottom to stopping location
  ; this should be where the filament can be moved while cold
  global ercf_extruder_park = 40
  global ercf_extruder_retract_park = 35
  global ercf_extruder_load_speed = 300
  global ercf_extruder_slow_speed = 1200
  global ercf_extruder_fast_speed = 2400
  global ercf_bowden_to_sensor = 27
  ; Galileo Clockwork with ERCF 1.1 sensor (hall effect) & Dragon Normal Flow : 60.5
  ; LGX on AfterBurner with ERCF 1.1 sensor (hall effect) & Dragon Normal Flow : 55.6
  ; AfterBurner Clockwork with ERCF 1.1 sensor (hall effect) & Dragon Normal Flow : 54.0
  global ercf_extruder_sensor_to_nozzle = 59
  ;
  ; selector servo settings
  ;
  global ercf_servo_pin = "exp.heater3"
  global ercf_servo_num = 0
  global ercf_servo_disengage = 30
  global ercf_servo_engage = 140
  ;
  ; filament block positions, additional blocks can be added and removed
  ; additional definitions can go here or in settings.g
  ; removed blocks should be commented/deleted out of this file
  ;
  global ercf_slot0_pos = 0
  global ercf_slot1_pos = 0
  global ercf_slot2_pos = 0
  global ercf_slot3_pos = 0
  global ercf_slot4_pos = 0
  global ercf_slot5_pos = 0
  global ercf_slot6_pos = 0
  global ercf_slot7_pos = 0
  global ercf_slot8_pos = 0
  global ercf_slot9_pos = 0
  global ercf_slot10_pos = 0
  global ercf_slot11_pos = 0
  global ercf_slot12_pos = 0
  global ercf_slot13_pos = 0
  global ercf_slot14_pos = 0
  global ercf_slot15_pos = 0
  global ercf_slot16_pos = 0
  global ercf_slot17_pos = 0
  ;
  ; filament sensor settings
  ;
  global ercf_encoder_pin = "e0stop"
  global ercf_encoder_trigger = 2
  global ercf_pulse_distance = 1.415
  ;
  ; tip forming
  ;
  global tip_cooling_tube_length = 15
  global tip_cooling_tube_retraction = 35
  global tip_initial_cooling_speed = 10
  global tip_final_cooling_speed = 50
  global tip_cooling_moves = 5
  global tip_toolchange_temp = 0
  global tip_use_skinnydip = 0
  global tip_use_fast_skinnydip = 1
  global tip_skinnydip_distance = 26
  global tip_dip_insertion_speed = 1980 ;mm/min (33mm/s)
  global tip_dip_extraction_speed = 4200 ;mm/min (70mm/s)
  global tip_melt_zone_pause = 0
  global tip_cooling_zone_pause = 0
  global tip_unloading_speed_start = 11940 ;mm/min (199mm/s)
  global tip_unloading_speed = 1200 ;mm/min (20mm/s)
  global tip_ramming_volume = 0
  global tip_initial_retract = 0
  global tip_final_eject = 0
  ;
  ; DO NOT EDIT
  ; non-configurable system state variables
  ;
  global ercf_pulse_count = 0
  global ercf_extruder_loaded = false
  global ercf_tmp_file = "ercf/none_edit/tmp.g"
  global ercf_selector_file = "ercf/lib/selector-state.g"
  global ercf_selector_pos = -1
  global ercf_servo_engaged = false
  global ercf_settings_loaded = true
