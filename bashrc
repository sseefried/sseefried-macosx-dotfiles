. ~/local/dotfiles/bash/env
. ~/local/dotfiles/bash/config
. ~/local/dotfiles/bash/aliases
if [ -d "$HOME/local/dotfiles/bash/$MACHINE" ]; then
	ENV_FILE="$HOME/local/dotfiles/bash/$MACHINE/env"
    [ -f $ENV_FILE ] && source $ENV_FILE
fi
