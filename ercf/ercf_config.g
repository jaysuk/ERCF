M98 P"0:/sys/ercf/none_edit/globals.g"
M98 P"0:/sys/ercf/settings.g"
M38 "0:/sys/ercf/auto_created/tools.g"
if result = 2
  echo "file not found"
elif result  = 1
  echo "M38 call failed"
elif result = 0
  M98 P"0:/sys/ercf/auto_created/tools.g"
if global.ercf_settings_adjusted
  M98 P"0:/sys/ercf/none_edit/setup_axis.g"
  M38 "0:/sys/ercf/current_state.g"
  if result = 2
    echo "file not found"
  elif result  = 1
    echo "M38 call failed"
  elif result = 0
    M98 P"0:/sys/ercf/current_state.g"