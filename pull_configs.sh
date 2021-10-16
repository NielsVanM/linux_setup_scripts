#!/bin/bash

rm -r ./i3 ./i3status ./polybar ./rofi ./.zshrc ./.p10k.zsh

cp -r ~/.config/i3 ./i3
cp -r ~/.config/i3status ./i3status
cp -r ~/.config/polybar ./polybar
cp -r ~/.config/rofi ./rofi
cp -r ~/.zshrc ./.zshrc
cp -r ~/.p10k.zsh ./.p10k.zsh
