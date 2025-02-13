; This is for controlling the DC motors
; param.A can be either F = forwards, R = reserve and O = off
; param.B this is the lane/tool number

if param.A !="F" || param.A !="R" || param.A !="O" ||
    M117 "Not specified if forwards, reverse or off"
    abort

var lane=param.B
var SLP_pin=global.AFC_SLP_pins[{var.lane}]
var DC1_pin=global.AFC_DC1_pins[{var.lane}]
var DC2_pin=global.AFC_DC2_pins[{var.lane}]

if param.A = "F"
    M950 P0 C{var.SLP_pin}
    M950 P1 C{var.SLP_pin}
    M950 P2 C{var.SLP_pin}
    M42 P0 S1
    M42 P2 S1

if param.A = "R"
    M950 P0 C{var.SLP_pin}
    M950 P1 C{var.SLP_pin}
    M950 P2 C{var.SLP_pin}
    M42 P0 S1
    M42 P1 S0.75

if param.A = "O"
    M42 P0 S0
    M42 P2 S0
    M950 P0 C"nil"
    M950 P1 C"nil"
    M950 P2 C"nil"