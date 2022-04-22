#!/usr/bin/env bash

style="$($HOME/.config/rofi/applets/applets/style.sh)"

dir="$HOME/.config/rofi/applets/applets/configs/$style"
rofi_command="rofi -theme $dir/quicklinks.rasi"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Browser
if [[ -f /usr/bin/firefox ]]; then
	app="firefox"
elif [[ -f /usr/bin/brave-browser ]]; then
	app="brave-browser"
elif [[ -f /usr/bin/chromium ]]; then
	app="chromium"
elif [[ -f /usr/bin/midori ]]; then
	app="midori"
else
	msg "No suitable web browser found!"
	exit 1
fi

# Links
youtube=""
facebook=""
twitter=""
github=""
mail=""
trello=""

# Variable passed to rofi
options="$youtube\n$facebook\n$github\n$twitter\n$mail\n$trello"

chosen="$(echo -e "$options" | $rofi_command -p "Open In  :  $app" -dmenu -selected-row 0)"
case $chosen in
    $youtube)
        $app https://www.youtube.com &
        ;;
    $facebook)
        $app https://www.facebook.com &
        ;;
    $twitter)
        $app https://www.twitter.com &
        ;;
    $github)
        $app https://www.github.com &
        ;;
    $mail)
        $app https://www.gmail.com &
        ;;
    $trello)
        $app https://www.trello.com &
        ;;
esac

