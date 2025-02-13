; This trigger is called once a print has been initiated if the buffer flags 
; that the filament in the bowden is less than is needed by the printer
; the mixing ratio is then adjusted so 5% more filament is fed from the lane than requested

if state.currentTool=0
    M567 P0 E1:1.05
if state.currentTool=1
    M567 P1 E1:1.05
if state.currentTool=2
    M567 P2 E1:1.05
if state.currentTool=3
    M567 P3 E1:1.05