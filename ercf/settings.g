; ==== settings ====
; once you have adjusted these settings, set this to true
set global.ercf_settings_adjusted = true						;Change this to true once you have edited these settings

set global.ercf_tool_count = 9							;Set this to the amount of tools you have
set global.standard_print_temperature = 205				;Set this to the temperature of the filament you print
set global.printer_extrude_speed = 300					;Speed to extrude filament from printer extruder in mm/min
set global.ercf_tool_filament_loaded = 0				;Fill in this value once known
set global.ercf_tool_filament_known = 42

; ==== Selector Settings ====
set global.ercf_selector_axis = "U"						;Set this to the axis letter you are going to use for the selector
set global.ercf_selector_driver = 124.1					;Set this to the driver to use for the selector
set global.ercf_selector_driver_direction = 1			;Set this to adjust the selector motor direction
set global.ercf_selector_endstop_pin = "124.io1.in"		;Set this to the selector endstop pin
set global.ercf_selector_current = 750					;Set this to the selector motor current
; Maximum axis travel for a 6 tool ERCF : 115
; Maximum axis travel for a 9 tool ERCF : 185
set global.ercf_selector_axis_max = 185					;Set this to the selector maximum travel

; ==== Extruder Settings ====
set global.ercf_extruder_axis = "V"						;Set this to the axis letter you are going to use for the extruder
set global.ercf_extruder_driver = 124.0					;Set this to the driver to use for the extruder
set global.ercf_extruder_driver_direction = 0			;Set this to adjust the extruder motor direction
set global.ercf_extruder_current = 1000					;Set this to the extruder motor current
set global.ercf_extruder_steps = 549.55024				;Set this to the steps per mm for the ERCF extruder. Calibrate as you would an extruder
set global.ercf_extruder_slow_speed = 2400
set global.ercf_extruder_fast_speed = 9000
set global.ercf_extruder_load_speed = 1200

; ==== Toolhead specific values ====
; Galileo Clockwork with ERCF V1.1 sensor (hall effect) : 27.0
; LGX on AfterBurner with ERCF V1.1 sensor (hall effect) : 44.0
; AfterBurner Clockwork with ERCF V1.1 sensor (hall effect) : 36.0
set global.ercf_bowden_to_sensor = 27
; Galileo Clockwork with ERCF 1.1 sensor (hall effect) & Dragon Normal Flow : 60.5
; LGX on AfterBurner with ERCF 1.1 sensor (hall effect) & Dragon Normal Flow : 55.6
; AfterBurner Clockwork with ERCF 1.1 sensor (hall effect) & Dragon Normal Flow : 54.0
set global.ercf_extruder_sensor_to_nozzle = 59
set global.toolhead_sensor_pin = "^20.io0.in"			;Set this to the input pin used by the toolhead sensor
set global.toolhead_sensor_num = 0						;Set this to the input number in RRF

; ==== Values to tune ====  
; Tool position for the selector. This has to be tuned manually. Up to 18 tools are currently supported.
set global.ercf_slot0_pos = 2.0
set global.ercf_slot1_pos = 23.6
set global.ercf_slot2_pos = 44.4
set global.ercf_slot3_pos = 70.4
set global.ercf_slot4_pos = 91.2
set global.ercf_slot5_pos = 112.2
set global.ercf_slot6_pos = 138.2
set global.ercf_slot7_pos = 159.2
set global.ercf_slot8_pos = 179.2
set global.ercf_slot9_pos = 0
set global.ercf_slot10_pos = 0
set global.ercf_slot11_pos = 0
set global.ercf_slot12_pos = 0
set global.ercf_slot13_pos = 0
set global.ercf_slot14_pos = 0
set global.ercf_slot15_pos = 0
set global.ercf_slot16_pos = 0
set global.ercf_slot17_pos = 0
; Base value for the loading length used by the auto-calibration macro
; Please use a value SMALLER than the real reverse bowden length (like 50mm less)
set global.ercf_bowden_length = 930						;Set this to the length og the bowden up to the top of the extruder
set global.ercf_retraction_length = 0					;Once you get consistent values to retract, set it here

; ==== Servo Settings ====
; Servo angle for the Up position (i.e. tool disengaged). Refer to the manual to know how to properly tune this value
; Default values:
; MG90S servo : 30
; SAVOX SH0255MG : 140
set global.ercf_servo_disengage = 25
; Servo angle for the Down position (i.e. tool engaged). Refer to the manual to know how to properly tune this value
; Default values:
; MG90S servo : 140
; SAVOX SH0255MG : 30
set global.ercf_servo_engage = 75
set global.ercf_servo_pin = "124.io0.out"				;Set the servo pin number
set global.ercf_servo_num = 1							;Set the servo number in RRF. You may already have another servo so check this.

set global.ercf_encoder_pin = "124.io2.in"
set global.ercf_pulse_distance = 1.3736


  ;
  ; tip forming
  ;
set global.tip_cooling_tube_length = 10
set global.tip_cooling_tube_retraction = 30
set global.tip_initial_cooling_speed = 50
set global.tip_final_cooling_speed = 250
set global.tip_cooling_moves = 5
set global.tip_toolchange_temp = 0
set global.tip_use_skinnydip = 1
set global.tip_use_fast_skinnydip = 1
set global.tip_skinnydip_distance = 26
set global.tip_dip_insertion_speed = 1980 ;mm/min (33mm/s)
set global.tip_dip_extraction_speed = 4200 ;mm/min (70mm/s)
set global.tip_melt_zone_pause = 0
set global.tip_cooling_zone_pause = 0
set global.tip_unloading_speed_start = 11940 ;mm/min (199mm/s)
set global.tip_unloading_speed = 1200 ;mm/min (20mm/s)
set global.tip_ramming_volume = 0
set global.tip_initial_retract = 0
set global.tip_final_eject = 0
