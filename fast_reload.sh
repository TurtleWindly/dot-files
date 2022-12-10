#!/bin/bash

rsync -r ~/.config/awesome/ awesome/
rsync -r ~/.config/cava/ cava/
rsync -r ~/.config/picom/ picom/
rsync -r ~/.config/rofi/ rofi/
rsync -r ~/.config/btop/ btop/
rsync -r ~/.config/helix/ helix/

echo "Done!"
