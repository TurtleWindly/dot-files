#!/bin/bash

rsync -r ~/.config/awesome/ awesome/
rsync -r ~/.config/cava/ cava/
rsync -r ~/.config/picom/ picom/
rsync -r ~/.config/rofi/ rofi/

echo "Done!"
