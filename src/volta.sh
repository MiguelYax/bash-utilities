[ ! -d "$HOME/.volta" ] && curl https://get.volta.sh | bash

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"