. ~/local/dotfiles/bash/env
. ~/local/dotfiles/bash/config
. ~/local/dotfiles/bash/aliases
if [ -d "$HOME/local/dotfiles/bash/$MACHINE" ]; then
  for file in env config aliases; do
	FILE="$HOME/local/dotfiles/bash/$MACHINE/env"
    [ -f $FILE ] && source $FILE
  done
fi
