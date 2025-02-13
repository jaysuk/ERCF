; This is for feeding the filament away from the extruder and back into the lane

; Disable the buffer
M950 J5 C"nil"                                               ; Advance
M950 J6 C"nil"                                               ; Trail
M581 P5 R-1
M581 P6 R-1

; This sets the colour of for this lane to blue to indicate a tool change is being under taken
set global.AFC_LED_array[3]=2
M98 P"0:/sys/AFC/LEDs.g"

; This move retracts the filament out of the extruder
G1 E-80 F120
M400

; This is to unmap the extruder
M98 P"0:/sys/AFC/Motors/Extruder_unmap.g" A3

; This unhides the axis used by the BT
M584 P7

; This is for retracting the filament out of the tube
M98 P"0:/sys/AFC/Motors/dc_motors.g" A"R" B3                 ; This sets the DC motor in reverse to wind the filament up
G1 'd{global.lane3_first_length} F{global.AFC_retract_speed} ; This retracts the filament
M400
M98 P"0:/sys/AFC/Motors/dc_motors.g" A"O" B3                 ; This turns the DC motor off

; Need to add a check of the hub here!!!

; This sets the LED colour back to green
set global.AFC_LED_array[3]=1
M98 P"0:/sys/AFC/LEDs.g"

; This hides the axes again
M584 P3