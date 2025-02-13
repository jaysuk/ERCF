M574 'a1 P"119.SW7"
G92 'a0
G28 'a
if move.axes[3].homed
    set global.lane0_loaded=true
if fileexists("0:/sys/AFC/AFC-info/lane0.g")
    M472 P"0:/sys/AFC/AFC-info/lane0.g"
echo >"0:/sys/AFC/AFC-info/lane0.g" "; lane0 status"
echo >>"0:/sys/AFC/AFC-info/lane0.g" {"set global.lane0_loaded = " ^ global.lane0_loaded}

set global.AFC_LED_array[0]=1
M98 P"0:/sys/AFC/LEDs.g"

M574 'a1 P"nil"