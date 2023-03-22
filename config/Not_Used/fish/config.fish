if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
end

alias vim="lvim"
alias nvim="lvim"

export SPICETIFY_PATH=$PATH:/home/brisolo/.spicetify
export GCM_CREDENTIAL_STORE='plaintext'

export PNPM_HOME="/home/brisolo/.local/share/pnpm"
export PATH="$PNPM_HOME:SPICETIFY_PATH:$PATH"

starship init fish | source
