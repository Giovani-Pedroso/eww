#!/bin/bash
# I would like tho thanks the github user thyeun. I copy part of his code 
# to make this script you can find the original in:
# https://github.com/thyeun/dotfiles/blob/master/V1/.config/eww/bar/scripts/workspace

workspaces(){
  i3-msg -t get_workspaces | jq 'map({name: .name, focused: .focused, urgent: .urgent, num: .num})' -Mc
}

workspaces
i3-msg -t subscribe -m '["workspace"]' | while read -r line ; do
  workspaces
done
