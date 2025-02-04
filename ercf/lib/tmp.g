var extrusion_amount = 0
var extrusion_amount_tool = 0
G92 V0
G91
G1 F1200 V560
set var.extrusion_amount = var.extrusion_amount+560
if state.status != "processing"
  M302 P1
while sensors.gpIn[0].value = 0
  G1 F1200 V1 E1
  set var.extrusion_amount_tool = iterations
if sensors.gpIn[0].value = 1
  if state.status != "processing"
    M302 P0
  M280 P1 S25
  set var.extrusion_amount = var.extrusion_amount+var extrusion_amount_tool
M400
G90
if state.status != "processing"
  M568 S205
  M116
G1 F300 E54
set var.extrusion_amount = var.extrusion_amount+54
set global.ercf_total_filament_loaded = var.extrusion_amount
set global.ercf_tool_filament_loaded = var.extrusion_amount_tool
M568 A0
