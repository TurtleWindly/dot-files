#!/usr/bin/env zsh

theme="style"
dir="$HOME/.config/rofi/launchers"

# dark
ALPHA="#ff00ff00"
BG="#000000aa"
FG="#DDDDDDff"
SELECT="#afffaaff"

ACCENT="#208aae"

# overwrite colors file
cat > $dir/colors.rasi <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF

rofi -no-lazy-grab -show run -modi run -theme $dir/"$theme"
