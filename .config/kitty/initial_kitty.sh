#!/bin/bash

screen_width=$(system_profiler SPDisplaysDataType | grep Resolution | awk '{print $2}')
screen_height=$(system_profiler SPDisplaysDataType | grep Resolution | awk '{print $4}')
kitty_width=$((screen_width / 2))
kitty_height=$((screen_height / 2))

kitty --override initial_window_width=${kitty_width} --override initial_window_height=${kitty_height} 2>/dev/null
