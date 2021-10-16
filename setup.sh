#!/bin/bash
sudo apt-get update
sudo apt-get install -y \
  i3\
  picom\
  materia-gtk-theme\
  papirus-icon-theme\
  lxappearance\
  git\
  rofi\
  polybar\
  net-tools\
  zsh\
  curl\
  powerline\
  fonts-powerline\
  python3-pip

sudo snap install code --classic
sudo snap install spotify --classic

# Move configs
cp -r ./i3 ~/.config/
cp -r ./i3status ~/.config/
cp -r ./polybar ~/.config/
cp -r ./rofi ~/.config/
cp -r ./.zshrc ~/.zshrc
cp -r ./.p10k.zsh ~/.p10k.zsh

# Install rofi themes
git clone https://github.com/davatorium/rofi-themes /tmp/rofi-themes
sudo cp /tmp/rofi-themes/User\ Themes/*.rasi /usr/share/rofi/themes/

# Switch shell to zshpip3 install autorandr
chsh -s /usr/bin/zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install PowerLevel10k theme
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Install autocomplete package
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install required fonts
FONT_DIR=/usr/share/fonts/truetype/meslo/
sudo mkdir $FONT_DIR
sudo wget -P $FONT_DIR https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
sudo wget -P $FONT_DIR https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
sudo wget -P $FONT_DIR https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
sudo wget -P $FONT_DIR https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

wget -P /tmp/ https://use.fontawesome.com/releases/v5.15.4/fontawesome-free-5.15.4-desktop.zip
unzip /tmp/fontawesome-free-5.15.4-desktop.zip -d /tmp/
sudo mv /tmp/fontawesome-free-5.15.4-desktop/otfs/*.otf /usr/share/fonts/opentype/font-awesome/

# Install autorandr for display handler
pip3 install autorandr

# Final Setup notes
echo "* Set the eth and wifi interfaces in polybar config"
echo "* If you didn't get the p10k configure wizard and the ZSH terminal does not look proper run `p10k configure`"

sudo rm -r /tmp/*
