sleep 3
scrot 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES)'

play ~/.config/rofi/applets/applets/Sound/camera.ogg