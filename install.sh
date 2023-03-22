echo "Installing config"
echo "Other configs will be overwritten, continue?"

install() {
    echo "\nLinking config files to $HOME/.config"
    ln -sf config/fish $HOME/.config/fish
    ln -sf config/bashtop $HOME/.config/bashtop
    ln -sf config/gtk-4.0 $HOME/.config/gtk-4.0
    ln -sf config/starship.toml $HOME/starship.toml

    echo "Linking other stuff"
    ln -sf config/spicetify $HOME/.spicetify
    ln -sf config/themes $HOME/.themes

    echo "Done!"
}

yes_or_no() {
    while true; do
        read -p "$*[y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "\nAborted" ; return  1 ;;
        esac
    done
}

yes_or_no && install