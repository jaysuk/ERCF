if global.lane3_loaded=true                      ; This checks to make sure there is filament loaded in the lane

    set global.AFC_LED_array[3]=2                ; This sets the colour to blue so we know filament is being loaded
    M98 P"0:/sys/AFC/LEDs.g"                     ; This calls the LED script
    M584 P7                                      ; This unhides all the axes
    M574 'd1 P{global.TN_switches[0]}            ; This sets the TN Advance pin as a homing switch for loading the filament
    echo sensors.endstops[6].triggered
    M400
    G4 P500
    G1 H4 'd20000 F{global.AFC_load_speed}       ; This is an arbitory load distance to cover the length of the buffer tube
    M400                                         ; finish all moves
    G91                                          ; relative mode
    G1 'd-15 F{global.AFC_retract_speed}         ; This retracts 15mm of filament to ensure the buffer is somewhere in the middle and not triggering either the trailing or advance switches
    M400                                         ; finish all moves
    G90                                          ; absolute mode
    M574 'd1 P"nil"                              ; free up the endstop pin for this axis
    M584 P3                                      ; hide all the BT axes
    M98 P"0:/sys/AFC/Motors/Extruder_setup.g" A3 ; setup the mixing extruder
else 
    M117 "No filament loaded in Lane 3"
    abort