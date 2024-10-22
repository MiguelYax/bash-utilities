if [[ $0 == *"zsh"* ]]; then

  ### ZSH HOME
  export ZSH=$HOME/.zsh
  export ZSH_PATH=$HOME/.zsh
  export ZSH_PLUGINS_PATH=$ZSH_PATH/plugins
  export ZSH_THEMES_PATH=$ZSH_PATH/themes

  mkdir -p $ZSH_PLUGINS_PATH $ZSH_THEMES_PATH

  # THEMES
  [ ! -d "$ZSH_THEMES_PATH/spaceship-prompt" ] && git clone https://github.com/spaceship-prompt/spaceship-prompt.git $ZSH_THEMES_PATH/spaceship-prompt

  ZSH_PLUGINS=(zsh-syntax-highlighting zsh-autosuggestions);

  for plugin in "${ZSH_PLUGINS[@]}"
  do 
    [ ! -d "$ZSH_PLUGINS_PATH/$plugin" ] && git clone "https://github.com/zsh-users/$plugin.git" "$ZSH_PLUGINS_PATH/$plugin"
  done

  ## HISTORY
  export HISTSIZE=10000
  export SAVEHIST=10000
  setopt SHARE_HISTORY
  setopt HIST_IGNORE_ALL_DUPS
  setopt HIST_FIND_NO_DUPS
  setopt APPENDHISTORY

  [ -s ~/.zsh_history ] && mv ~/.zsh_history $ZSH_PATH
  export HISTFILE=$ZSH_PATH/.zsh_history 


  ### ---- PLUGINS & THEMES -----------------------------------
  source $ZSH/themes/spaceship-prompt/spaceship.zsh-theme
  source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
  source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

  ### --- Spaceship Config ------------------------------------

  SPACESHIP_PROMPT_ORDER=(
    user          # Username section
    dir           # Current directory section
    host          # Hostname section
    git           # Git section (git_branch + git_status)
    node          # Node version
    exec_time     # Execution time
    line_sep      # Line break
    # vi_mode       # Vi-mode indicator
    # jobs          # Background jobs indicator
    exit_code     # Exit code section
    # char          # Prompt character
  )

fi
