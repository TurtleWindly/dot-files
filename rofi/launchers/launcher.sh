#!/usr/bin/env bash

theme="style"
dir="$HOME/.config/rofi/launchers"

# dark
ALPHA="#ff00ff00"
BG="#000000aa"
FG="#DDDDDDff"
SELECT="#afffaaff"

ACCENT="#FA8334"

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

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"
