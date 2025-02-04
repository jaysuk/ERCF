var ratio = global.tip_ramming_volume/23
var total_retraction_distance = global.tip_cooling_tube_retraction + global.tip_cooling_tube_length/2 - 15
var current_temp_setting = heat.heaters[1].active
var speed_inc = global.tip_final_cooling_speed - global.tip_initial_cooling_speed / 2 * global.tip_cooling_moves - 1
var move_iterations = 0

G92 E0

; Ramming with SuperSlicer standard setting
if global.tip_initial_retract=1
  M118 S"Ramming with SuperSlicer standard setting"
  G1 E-8.5 F3000
  set global.ercf_unload_track = global.ercf_unload_track + 8.5

G1 E{0.5784 * var.ratio} F299
set global.ercf_unload_track = global.ercf_unload_track - (0.5784 * var.ratio)
G1 E{0.5834 * var.ratio} F302
set global.ercf_unload_track = global.ercf_unload_track - (0.5834 * var.ratio)
G1 E{0.5918 * var.ratio} F306
set global.ercf_unload_track = global.ercf_unload_track - (0.5918 * var.ratio)
G1 E{0.6169 * var.ratio} F319
set global.ercf_unload_track = global.ercf_unload_track - (0.6169 * var.ratio)
G1 E{0.3393 * var.ratio} F350
set global.ercf_unload_track = global.ercf_unload_track - (0.3393 * var.ratio)
G1 E{0.3363 * var.ratio} F350
set global.ercf_unload_track = global.ercf_unload_track - (0.3363 * var.ratio)
G1 E{0.7577 * var.ratio} F392
set global.ercf_unload_track = global.ercf_unload_track - (0.7577 * var.ratio)
G1 E{0.8382 * var.ratio} F434
set global.ercf_unload_track = global.ercf_unload_track - (0.8382 * var.ratio)
G1 E{0.7776 * var.ratio} F469
set global.ercf_unload_track = global.ercf_unload_track - (0.7776 * var.ratio)
G1 E{0.1293 * var.ratio} F469
set global.ercf_unload_track = global.ercf_unload_track - (0.1293 * var.ratio)
G1 E{0.9673 * var.ratio} F501
set global.ercf_unload_track = global.ercf_unload_track - (0.9673 * var.ratio)
G1 E{1.0176 * var.ratio} F527
set global.ercf_unload_track = global.ercf_unload_track - (1.0176 * var.ratio)
G1 E{0.5956 * var.ratio} F544
set global.ercf_unload_track = global.ercf_unload_track - (0.5956 * var.ratio)
G1 E{0.4555 * var.ratio} F544
set global.ercf_unload_track = global.ercf_unload_track - (0.4555 * var.ratio)
G1 E{1.0622 * var.ratio} F552
set global.ercf_unload_track = global.ercf_unload_track - (1.0622 * var.ratio)

; set toolchange temperature just prior to filament being extracted from melt zone and wait"
if {global.tip_toolchange_temp > 0 & global.tip_use_fast_skinnydip = 0}
  M118 S"Set toolchange temperature just prior to filament being extracted from melt zone and wait""
  M568 A1 S{global.tip_toolchange_temp}
  M116

; Retraction
M118 S"Retraction"
G1 E-15 F{global.tip_unloading_speed_start}
set global.ercf_unload_track = global.ercf_unload_track + 15
G1 E{-(var.total_retraction_distance*0.7)} F{1 * global.tip_unloading_speed}
set global.ercf_unload_track = global.ercf_unload_track + (var.total_retraction_distance*0.7)
G1 E{-(var.total_retraction_distance*0.2)} F{0.5 * global.tip_unloading_speed}
set global.ercf_unload_track = global.ercf_unload_track + (var.total_retraction_distance*0.2)
G1 E{-(var.total_retraction_distance*0.1)} F{0.3 * global.tip_unloading_speed}
set global.ercf_unload_track = global.ercf_unload_track + (var.total_retraction_distance*0.1)

if {global.tip_toolchange_temp > 0 & global.tip_use_fast_skinnydip = 1}
  M568 A1 S{global.tip_toolchange_temp}

; Generate Cooling Moves
M118 S"Generate Cooling Moves"
while var.move_iterations < global.tip_cooling_moves
  set var.move_iterations = iterations
  G1 E{global.tip_cooling_tube_length} F{global.tip_initial_cooling_speed + (var.speed_inc * var.move_iterations * 2)}
  set global.ercf_unload_track = global.ercf_unload_track - global.tip_cooling_tube_length
  G1 E{-global.tip_cooling_tube_length} F{global.tip_initial_cooling_speed + (var.speed_inc * (var.move_iterations * 2+1))}
  set global.ercf_unload_track = global.ercf_unload_track + global.tip_cooling_tube_length

; wait for extruder to reach toolchange temperature(SKINNYDIP--fast mode only)
if {global.tip_toolchange_temp > 0 & global.tip_use_fast_skinnydip = 1}
  M118 S"wait for extruder to reach toolchange temperature(SKINNYDIP--fast mode only)"
  M568 A1 S{global.tip_toolchange_temp}
  M116

; Generate a skinnydip move
if global.tip_use_skinnydip = 1
  M118 S"Generate a skinnydip move"
  G1 E{global.tip_skinnydip_distance} F{global.tip_dip_insertion_speed}
  set global.ercf_unload_track = global.ercf_unload_track + global.tip_skinnydip_distance
  G4 P{global.tip_melt_zone_pause}
  G1 E{-global.tip_skinnydip_distance} F{global.tip_dip_extraction_speed}
  set global.ercf_unload_track = global.ercf_unload_track - global.tip_skinnydip_distance
  G4 P{global.tip_cooling_zone_pause}

if global.tip_toolchange_temp > 0
  M568 A1 S{var.current_temp_setting}

if global.tip_final_eject = 1
  M118 S"Final Eject"
  G92 E0
  G1 E-80 F3000
  set global.ercf_unload_track = global.ercf_unload_track + 80

;G92 E0