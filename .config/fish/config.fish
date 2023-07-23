#if status is-interactive
    # Commands to run in interactive sessions can go here
#end

set fish_greeting

#export SPICETIFY_PATH=$PATH:/home/brisolo/.spicetify

#export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$HOME/.npm-global/bin:$HOME/.cargo/bin:$PATH"

# Aliases
alias sunshine "sudo -i PULSE_SERVER=unix:(pactl info | awk '/Server String/{print$3}') flatpak run dev.lizardbyte.sunshine"

#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

starship init fish | source

set PATH /home/brisolo32/.cargo/bin /home/brisolo32/.local/bin /home/brisolo32/.npm-global/bin:/home/brisolo32/.cargo/bin:/home/brisolo32/.local/share/nvm/v20.4.0/bin:$HOME/.deno/bin:/var/lib/flatpak/exports/share:/home/brisolo/.spicetify:/home/brisolo/.local/bin:/home/brisolo/.cargo/bin:/home/brisolo32/.npm-global/bin:/home/brisolo32/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin
