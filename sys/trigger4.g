M574 'c1 P"119.SW9"
G92 'c0
G28 'c
if move.axes[5].homed
    set global.lane2_loaded=true
if fileexists("0:/sys/AFC/AFC-info/lane2.g")
    M472 P"0:/sys/AFC/AFC-info/lane2.g"
echo >"0:/sys/AFC/AFC-info/lane2.g" "; lane2 status"
echo >>"0:/sys/AFC/AFC-info/lane2.g" {"set global.lane2_loaded = " ^ global.lane2_loaded}

set global.AFC_LED_array[2]=1
M98 P"0:/sys/AFC/LEDs.g"

M574 'c1 P"nil"