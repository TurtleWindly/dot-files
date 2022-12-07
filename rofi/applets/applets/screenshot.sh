#!/usr/bin/bash

style_dir="$HOME/.config/rofi/applets/applets/configs/screenshot.rasi"
rofi_command="rofi -theme $style_dir"

# Error msg
msg() {
 rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "Please install 'scrot' first."
}

# Options
screen=""
area=""
window=""

# Variable passed to rofi
list="$screen\n$area\n$window"

chosen="$(echo -e "$list" | $rofi_command -p 'scrot' -dmenu -selected-row 0)"
case $chosen in
    $screen)
  if [[ -f /usr/bin/scrot ]]; then
            ~/.config/rofi/applets/applets/camera.sh
  else
   msg
  fi
        ;;
    $area)
  if [[ -f /usr/bin/scrot ]]; then
   scrot -s 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES)'
            play ~/.config/rofi/applets/applets/Sound/camera.ogg
  else
   msg
  fi
        ;;
    $window)
        if [[ -f /usr/bin/scrot ]]; then
            sleep 1; scrot -u 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES)'
            play ~/.config/rofi/applets/applets/Sound/camera.ogg
  else
   msg
  fi
        ;;
esac

