#!/usr/bin/env bash

# Franklin Souza
# @FranklinTech

# Criando pastas
FOLDER_CREATE(){
  clear
  mkdir $HOME/.frannks-mydots
  mkdir $HOME/.compile
  mkdir $HOME/.config/hypr
  mkdir $HOME/.config/hypr/scripts
  mkdir $HOME/.config/waybar
  mkdir $HOME/.config/swaylock
  mkdir $HOME/.config/dunst
  mkdir $HOME/.config/wofi
  mkdir $HOME/.config/nvim
  mkdir $HOME/.config/kitty
  mkdir $HOME/.config/spotifyd
  mkdir $HOME/.fonts
  mkdir $HOME/.themes
  mkdir $HOME/.icons
  mkdir $HOME/.local/bin
  mkdir $HOME/Wallpapers
  mkdir $HOME/.projects
  mkdir $HOME/Franks
  mkdir $HOME/Scripts
  mkdir -p $HOME/.config/waybar/scripts
  mkdir -p $HOME/.config/wlogout
  mkdir -p $HOME/Franks/Estudos
  mkdir -p $HOME/Franks/Games/PPSSPP
  mkdir -p $HOME/Franks/Python
  mkdir -p $HOME/Franks/C
  mkdir -p $HOME/Franks/Android
  mkdir -p $HOME/Franks/Projetos/Repository
}

# Instalação de pacotes
PACKAGES_INSTALL(){
  clear && sudo pacman -S archlinux-keyring --noconfirm
  clear && sudo pacman -S rustup firefox-i18n-pt-br git dosfstools npm thunderbird thunderbird-dark-reader thunderbird-i18n-pt-br gucharmap catimg mangohud gamescope wofi bitwarden qemu pavucontrol pipewire pipewire-alsa pipewire-pulse slurp cronie htop unzip unrar zip p7zip tor dunst fuse mpv pacman-contrib gvfs-mtp xdg-user-dirs ttf-fira-code zsh zsh-autosuggestions zsh-syntax-highlighting reflector ttf-jetbrains-mono ttf-dejavu ttf-font-awesome bc lsd yt-dlp bat net-tools wf-recorder dosfstools nodejs yarn fzf ueberzug man-db python-pywal wget pyenv python-pipx python-jedi python-gobject python-pylint python-requests python-pyperclip --noconfirm && xdg-user-dirs-update
  rustup default stable && clear
}

# Compilando pacotes AUR
AUR_BUILD(){
  cd $HOME/.compile
  git clone https://aur.archlinux.org/wal-telegram-git.git
  cd wal-telegram-git
  makepkg -sic --noconfirm

  cd $HOME/.compile
  git clone https://aur.archlinux.org/swaylock-effects.git
  cd swaylock-effects
  makepkg -sic --noconfirm

  clear
  cd $HOME/.projects
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
  echo 'source ~/.projects/powerlevel10k/powerlevel10k.zsh-theme' >> $HOME/.zshrc

  clear
  cd $HOME/.projects
  git clone https://github.com/GideonWolfe/Zathura-Pywal.git
  cd Zathura-Pywal && chmod +x install.sh && ./install.sh

  clear
  cd $HOME/.frannks-mydots
  git clone https://github.com/frannks/mydots-hyprland.git
}

# Copiando arquivos
FILES_COPY(){
  clear && echo -e "[!] Copiando arquivos..." && sleep 2
  cp $HOME/.frannks-mydots/mydots-hyprland/bin/* $HOME/.local/bin && cd $HOME/.local/bin && chmod +x *
  cp $HOME/.frannks-mydots/mydots-hyprland/scripts/* $HOME/Scripts && cd $HOME/Scripts && chmod +x *
  cp $HOME/.frannks-mydots/mydots-hyprland/.fonts/* $HOME/.fonts
  cp $HOME/.frannks-mydots/mydots-hyprland/home/.zshrc $HOME
  cp $HOME/.frannks-mydots/mydots-hyprland/home/.zshenv $HOME
  cp $HOME/.frannks-mydots/mydots-hyprland/home/.zprofile $HOME
  cp $HOME/.frannks-mydots/mydots-hyprland/home/.aliases $HOME
  cp $HOME/.frannks-mydots/mydots-hyprland/home/.scripts $HOME
  cp $HOME/.frannks-mydots/mydots-hyprland/home/.emojis $HOME
  touch .zhistory $HOME
  sudo cp $HOME/.frannks-mydots/mydots-hyprland/.fonts/Iosevka-Medium.ttf /usr/share/fonts/TTF
  sudo cp $HOME/.frannks-mydots/mydots-hyprland/.fonts/Iosevka-Bold.ttf /usr/share/fonts/TTF
  sudo cp $HOME/.frannks-mydots/mydots-hyprland/.fonts/Poppins.otf /usr/share/fonts
  sudo cp $HOME/.frannks-mydots/mydots-hyprland/.fonts/MesloLGS NF Regular.ttf /usr/share/fonts/TTF
  cp $HOME/.frannks-mydots/mydots-hyprland/.config/kitty/kitty.conf $HOME/.config/kitty
  cp $HOME/.frannks-mydots/mydots-hyprland/.config/kitty/theme.conf $HOME/.config/kitty
  cp $HOME/.frannks-mydots/mydots-hyprland/.config/hypr/hyprland.conf $HOME/.config/hypr
  cp $HOME/.frannks-mydots/mydots-hyprland/.config/hypr/scripts/* $HOME/.config/hypr/scripts && chmod +x $HOME/.config/waybar/scripts/*
  cp $HOME/.frannks-mydots/mydots-hyprland/.config/hypr/hyprpaper.conf $HOME/.config/hypr
  cp $HOME/.frannks-mydots/mydots-hyprland/.config/waybar/config.jsonc $HOME/.config/waybar
  cp $HOME/.frannks-mydots/mydots-hyprland/.config/waybar/scripts/* $HOME/.config/waybar/scripts && chmod +x $HOME/.config/waybar/scripts/*
  cp $HOME/.frannks-mydots/mydots-hyprland/.config/waybar/style.css $HOME/.config/waybar
  cp $HOME/.frannks-mydots/mydots-hyprland/.config/wlogout/style.css $HOME/.config/wlogout
  cp $HOME/.frannks-mydots/mydots-hyprland/.config/swaylock/config $HOME/.config/swaylock
  cp $HOME/.frannks-mydots/mydots-hyprland/.config/wofi $HOME/.config/wofi
  cp $HOME/.frannks-mydots/mydots-hyprland/.config/dunst/dunstrc $HOME/.config/dunst
  cp $HOME/.frannks-mydots/mydots-hyprland/.config/dunst/launchdunst.sh $HOME/.config/dunst && chmod +x $HOME/.config/dunst/launchdunst.sh
  cp $HOME/.frannks-mydots/mydots-hyprland/home/.xcompose $HOME
  xdg-mime default org.pwmt.zathura.desktop application/pdf
  cp $HOME/.frannks-mydots/mydots-hyprland/.config/nvim/init.vim $HOME/.config/nvim
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  cp -r $HOME/.local/share/nvim/site/autoload $HOME/.config/nvim
  clear && cd $HOME/Wallpapers
   wget -c "https://raw.githubusercontent.com/frannks/wallpack/main/013.png"
   wal -i $HOME/Wallpapers/013.png
   sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji --noconfirm
   clear && read -p "INSTALAÇÃO FINALIZADA PRESSIONE ENTER PARA CONCLUIR!!!" && clear && exit 0
}
FOLDER_CREATE
PACKAGES_INSTALL
AUR_BUILD
FILES_COPY
