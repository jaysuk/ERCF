M98 P"0:/sys/AFC/AFC-vars.g"

;######## Motors ################
M569 P119.0 S{global.AFC_stepper_direction}
M569 P119.1 S{global.AFC_stepper_direction}
M569 P119.2 S{global.AFC_stepper_direction}
M569 P119.3 S{global.AFC_stepper_direction}

M584 'a119.0 'b119.1 'c119.2 'd119.3 
M350 'a{global.AFC_microsteps[0]} 'b{global.AFC_microsteps[1]} 'c{global.AFC_microsteps[2]} 'd{global.AFC_microsteps[3]}
M92 'a{global.AFC_steps_per_mm[0]} 'b{global.AFC_steps_per_mm[1]} 'c{global.AFC_steps_per_mm[2]} 'd{global.AFC_steps_per_mm[3]}
M906 'a{global.AFC_stepper_current[0]} 'b{global.AFC_stepper_current[1]} 'c{global.AFC_stepper_current[2]} 'd{global.AFC_stepper_current[3]}
M566 'a{global.AFC_stepper_jerk[0]} 'b{global.AFC_stepper_jerk[1]} 'c{global.AFC_stepper_jerk[2]} 'd{global.AFC_stepper_jerk[3]}                     ; set maximum instantaneous speed changes (mm/min)
M203 'a{global.AFC_stepper_max_speed[0]} 'b{global.AFC_stepper_max_speed[1]} 'c{global.AFC_stepper_max_speed[2]} 'd{global.AFC_stepper_max_speed[3]} ; set maximum speeds (mm/min)
M201 'a{global.AFC_stepper_acc[0]} 'b{global.AFC_stepper_acc[1]} 'c{global.AFC_stepper_acc[2]} 'd{global.AFC_stepper_acc[3]}                         ; set accelerations (mm/s^2)
M208 'a-100 'b-100 'c-100 'd-100 s1
M208 'a20000 'b20000 'c20000 'd20000 s0

;######## Lane Triggers #########
M950 J0 C{global.AFC_prep_switch[0]}                                                                                                                 ; Lane 0 Prep
M950 J1 C{global.AFC_prep_switch[1]}                                                                                                                 ; Lane 1 Prep
M950 J2 C{global.AFC_prep_switch[2]}                                                                                                                 ; Lane 2 Prep
M950 J3 C{global.AFC_prep_switch[3]}                                                                                                                 ; Lane 3 Prep
M581 P0 R2 T2 S1                                                                                                                                     ; Lane 0 trigger2.g
M581 P1 R2 T3 S1                                                                                                                                     ; Lane 1 trigger3.g
M581 P2 R2 T4 S1                                                                                                                                     ; Lane 2 trigger4.g
M581 P3 R2 T5 S1                                                                                                                                     ; Lane 3 trigger5.g

;######## Tools #################
M563 P0 D0 H1 F0                                                                                                                                     ; define tool 0
G10 P0 X0 Y0 Z0                                                                                                                                      ; set tool 0 axis offsets
G10 P0 R0 S0                                                                                                                                         ; set initial tool 0 active and standby temperatures to 0C

M563 P1 D0 H1 F0                                                                                                                                     ; define tool 0
G10 P1 X0 Y0 Z0                                                                                                                                      ; set tool 0 axis offsets
G10 P1 R0 S0                                                                                                                                         ; set initial tool 0 active and standby temperatures to 0C

M563 P2 D0 H1 F0                                                                                                                                     ; define tool 0
G10 P2 X0 Y0 Z0                                                                                                                                      ; set tool 0 axis offsets
G10 P2 R0 S0                                                                                                                                         ; set initial tool 0 active and standby temperatures to 0C

M563 P3 D0 H1 F0                                                                                                                                     ; define tool 0
G10 P3 X0 Y0 Z0                                                                                                                                      ; set tool 0 axis offsets
G10 P3 R0 S0                                                                                                                                         ; set initial tool 0 active and standby temperatures to 0C

;######## Lane 0 info ###########
if fileexists("0:/sys/AFC/AFC-info/lane0.g")
    M98 P"0:/sys/AFC/AFC-info/lane0.g"
if fileexists("0:/sys/AFC/AFC-info/lane0firstlength.g")
    M98 P"0:/sys/AFC/AFC-info/lane0firstlength.g"
if global.lane0_loaded
    G92 'a{global.lane0_first_length}
    M17 'a

;######## Lane 1 info ###########
if fileexists("0:/sys/AFC/AFC-info/lane1.g")
    M98 P"0:/sys/AFC/AFC-info/lane1.g"
if fileexists("0:/sys/AFC/AFC-info/lane1firstlength.g")
    M98 P"0:/sys/AFC/AFC-info/lane1firstlength.g"
if global.lane1_loaded
    G92 'b{global.lane1_first_length}
    M17 'b

;######## Lane 2 info ###########
if fileexists("0:/sys/AFC/AFC-info/lane2.g")
    M98 P"0:/sys/AFC/AFC-info/lane2.g"
if fileexists("0:/sys/AFC/AFC-info/lane2firstlength.g")
    M98 P"0:/sys/AFC/AFC-info/lane2firstlength.g"
if global.lane2_loaded
    G92 'c{global.lane2_first_length}
    M17 'c

;######## Lane 3 info ###########
if fileexists("0:/sys/AFC/AFC-info/lane3.g")
    M98 P"0:/sys/AFC/AFC-info/lane3.g"
if fileexists("0:/sys/AFC/AFC-info/lane3firstlength.g")
    M98 P"0:/sys/AFC/AFC-info/lane3firstlength.g"
if global.lane3_loaded
    G92 'd{global.lane3_first_length}
    M17 'd

if fileexists("0:/sys/AFC/AFC-info/lanelengths.g")
    M98 P"0:/sys/AFC/AFC-info/lanelengths.g"

;######## LEDs ##################
M950 E0 C"119.neopixel1" T2 U4
if fileexists("0:/sys/AFC/AFC-info/LEDs.g")
    M98 P"0:/sys/AFC/AFC-info/LEDs.g"
M98 P"0:/sys/AFC/LEDs.g"

M584 P3