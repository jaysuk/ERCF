; This file is used to setup the mixing hotend for the lane of the BT and the extruder on the printer
; param.A is the tool number

var toolNumber = param.A            ; This just sets up a variable for the param                                                        

M584 E{global.extruder_driver}      ; This maps the current extruder driver and the driver for the correct channel as extruders
M563 P{var.toolNumber} D0 H1 F0     ; This sets up the tool parameters and sets the two drivers as a mixing hotend setup

M350 E{global.extruder_microsteps}  ; This sets the microsteps for both steppers
M92 E{global.extruder_steps_per_mm} ; This sets the steps per mm for both steppers
M906 E{global.extruder_current}     ; This sets the current for both steppers
M566 E{global.extruder_jerk}        ; This sets the maximum instantaneous speed changes (mm/min) for both steppers
M203 E{global.extruder_max_speed}   ; This sets the maximum speeds (mm/min) for both steppers
M201 E{global.extruder_acc}         ; This sets the accelerations for both steppers