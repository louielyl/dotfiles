# NOTE: Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# NOTE: Initialization code that may require console input (password prompts, [y/n]
# NOTE: confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# NOTE: oh-my-zsh Setup
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# NOTE: Zsh-vi-mode settings, to prevent the zvm override other keybinds, such as fzf in insert mode
ZVM_INIT_MODE=sourcing

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  autoupdate
  you-should-use
  zsh-vi-mode
  zsh-docker-aliases
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# NOTE: Initiates oh-my-zsh with plugins above.
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# NOTE: Base setup
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST # NOTE: For caching (https://stackoverflow.com/a/71271754/14923262)
HISTSEARCH="history-beginning-search"

# NOTE: Brew setup
export HOMEBREW_NO_AUTO_UPDATE=1

# NOTE: Personal aliases
alias vim="nvim --listen /tmp/nvim-server.pipe" # NOTE: Suggested by lazygit.nvim
alias vnvim='nvim $HOME/.config/nvim' # NOTE: Suggested by lazygit.nvim
alias vzsh="nvim $HOME/.zshrc"
alias szsh="source $HOME/.zshrc"
alias studio="open -a /Applications/Android\ Studio.app"
alias adbd="adb devices"
alias adbr="adb reverse tcp:8081 tcp:8081"
alias m1podinstall="arch -x86_64 pod install"
alias m1podupdate="arch -x86_64 pod update"
alias lzg="lazygit"
alias lzd="lazydocker"
alias vtmux="nvim $HOME/.tmux.conf"
alias stmux="tmux source $HOME/.tmux.conf"
alias vtmuxpwl="cd $HOME/.tmux/plugins/tmux-powerline"
alias pnpx="pnpm dlx"

# NOTE: VIM paths
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim

# NOTE: Android Studio Setup
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# NOTE: OpenJDK Setup
export PATH=$PATH:/opt/homebrew/opt/openjdk/bin
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
# export JAVA_HOME='/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home' # Init at 2021
export JAVA_HOME='/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home' # Update at 2023

# NOTE: Docker Setup
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# NOTE: Nvim Setup
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# NOTE: Yarn Setup
export PATH=$PATH:$(yarn global bin)

# NOTE: pnpm setup
export PNPM_HOME=$HOME/Library/pnpm
export PATH="$PATH:$PNPM_HOME"
# pnpm endexport 

# NOTE: npm setup fix (https://stackoverflow.com/a/55274930/14923262)
export PATH=~/.npm-global/bin:$PATH

# NOTE: thefuck setup
eval $(thefuck --alias fk)

# NOTE: rust setup
export PATH=$PATH:$HOME/.cargo/bin:

# NOTE: This line will remove duplicate paths
typeset -U PATH 

# NOTE: Power10k setup (allow to run p10k command)
# source ~/powerlevel10k/powerlevel10k.zsh-theme
source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme
# NOTE: To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# NOTE: pyenv for old version Pythons
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# NOTE: fzf Setup
source <(fzf --zsh)

# NOTE: Zoxide Setup
eval "$(zoxide init zsh)"

export GPG_TTY=$(tty)
