M568 P3 S210                         ; Enable the hotend to this temperature
M116 P0                              ; Wait for it to reach that temperature
G1 E{global.extruder_to_nozzle} F120 ; This gets the filament to the nozzle
set global.AFC_LED_array[3]=1        ; This sets the colour back to green
M98 P"0:/sys/AFC/LEDs.g"
M950 J5 C{global.TN_switches[1]}     ; Advance
M950 J6 C{global.TN_switches[0]}    ; Trail
M581 P5 R1 T6 S1                     ; TN Advance trigger5.g
M581 P6 R1 T7 S1                     ; TN Trailing trigger6.g