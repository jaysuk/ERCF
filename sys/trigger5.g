M584 P7
M574 'd1 P"119.SW10"
G92 'd0
G28 'd
if move.axes[6].homed
    set global.lane3_loaded=true
    if fileexists("0:/sys/AFC/AFC-info/lane3.g")
        M472 P"0:/sys/AFC/AFC-info/lane3.g"
    echo >"0:/sys/AFC/AFC-info/lane3.g" "; lane3 status"
    echo >>"0:/sys/AFC/AFC-info/lane3.g" {"set global.lane3_loaded = " ^ global.lane3_loaded}
    if fileexists("0:/sys/AFC/AFC-info/lane3firstlength.g")
        G1 'd{global.lane3_first_length} F1000
        M400

    set global.AFC_LED_array[3]=1
    M98 P"0:/sys/AFC/LEDs.g"

M574 'd1 P"nil"
M584 P3