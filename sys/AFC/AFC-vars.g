; ########## Settings to Edit #####
global AFC_stepper_direction=0
global AFC_microsteps={16,16,16,16}
global AFC_steps_per_mm={682,682,682,682}
global AFC_stepper_current={1000,1000,1000,1000}
global AFC_stepper_jerk={300,300,300,300,300}                             ; lanes 0 to 3 and then for the extruder
global AFC_stepper_max_speed={2000,2000,2000,2000,4800}                   ; lanes 0 to 3 and then for the extruder
global AFC_stepper_acc={600,600,600,600,5000}
global AFC_driver_number={119.0,119.1,119.2,119.3}
global AFC_load_speed=2000
global AFC_retract_speed=2000

global extruder_driver=0.3                                                ; This is the driver number of your main extruder. To be edited
global extruder_microsteps=16                                             ; This is the microstepping of your main extruder. To be edited
global extruder_steps_per_mm=606.56                                       ; This is the steps per mm of your main extruder. To be edited
global extruder_jerk=300                                                  ; This is the jerk/maximum instantaneous speed changes of your main extruder. To be edited
global extruder_max_speed=4800                                            ; This is the maximum speed of your main extruder. To be edited
global extruder_acc=5000                                                  ; This is the acceleration of your main extruder. To be edited
global extruder_current=800                                               ; This is the current of your main extruder. To be edited
global extruder_to_nozzle=77                                              ; This is the extruder to nozzle length

global AFC_SLP_pins={"119.SLP1","119.SLP2","119.SLP3","119.SLP4"}         ; These are the SLP pins used by the DC motors
global AFC_DC1_pins={"119.dc11","119.dc12","119.dc13","119.dc14"}         ; These are the DC1 pins used by the DC motors
global AFC_DC2_pins={"119.dc21","119.dc22","119.dc23","119.dc24"}         ; These are the DC2 pins used by the DC motors
global AFC_prep_switch={"^!119.SW2","^!119.SW3","^!119.SW4","^!119.SW5",} ; These are the prep switches of each lane
global AFC_load_switch={"119.SW7","119.SW8","119.SW9","119.SW10",}        ; These are the load switches of each lane
global TN_switches={"119.SW11","119.SW12"}                                ; These are in the order of Advance and Trailing
global AFC_hub_switch="119.SW1"

; ########## Lane 0 Info ##########
global lane0_loaded=false
global lane0_first_length=0
global lane0_total_length=0

; ########## Lane 1 Info ##########
global lane1_loaded=false
global lane1_first_length=0
global lane1_total_length=0

; ########## Lane 2 Info ##########
global lane2_loaded=false
global lane2_first_length=0
global lane2_total_length=0

; ########## Lane 3 Info ##########
global lane3_loaded=false
global lane3_first_length=0
global lane3_total_length=0

; ########## Additional Info ##########
global additional_length=0
global AFC_LED_array={0,0,0,0}