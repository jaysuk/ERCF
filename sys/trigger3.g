M574 'b1 P"119.SW8"
G92 'b0
G28 'b
if move.axes[4].homed
    set global.lane1_loaded=true
if fileexists("0:/sys/AFC/AFC-info/lane1.g")
    M472 P"0:/sys/AFC/AFC-info/lane1.g"
echo >"0:/sys/AFC/AFC-info/lane1.g" "; lane1 status"
echo >>"0:/sys/AFC/AFC-info/lane1.g" {"set global.lane1_loaded = " ^ global.lane1_loaded}

set global.AFC_LED_array[1]=1
M98 P"0:/sys/AFC/LEDs.g"

M574 'b1 P"nil"