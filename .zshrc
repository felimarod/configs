# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export DOTFILES="$HOME/.dotfiles"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

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
    zsh-autosuggestions 
    zsh-syntax-highlighting 
    sudo
)

source $ZSH/oh-my-zsh.sh
# export ZSH_DISABLE_COMPIX=true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=es_CO.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

export GIT_EDITOR=nvim

### Manual aliases
# Set personal aliases, overriding those provided by oh-my-zsh libs, plugins, and themes. Aliases can be placed here, though oh-my-zsh users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Atajos
alias q=exit
alias c=openConfig
function openConfig {
    if [ $# -eq 0 ]; then
	nvim $DOTFILES
    else
	case $1 in
	    v)
		nvim $DOTFILES/nvim
		;;
	    z)
		nvim $DOTFILES/.zshrc
		;;
	    wmd)
		nvim $DOTFILES/.bspwm
		;;
	    bsp)
		nvim $DOTFILES/.bspwm/bspwm/bspwmrc
		;;
	    sxh)
		nvim $DOTFILES/.bspwm/sxhkd/sxhkdrc
		;;
	    *)
		echo Ingrese un argumento valido
		echo "\t"v\) open nvim directory, you can also use vc
		echo "\t"z\) open ZSH config file, you can also use zshc
		echo "\t"wmd\) open bspwm directory, you can also use cwm
		echo "\t"bsp\) open bspwm config file
		echo "\t"sxh\) open sxhkd config file
		;;
	esac
    fi
}
alias zshc="nvim $DOTFILES/.zshrc"
alias vc="nvim $DOTFILES/nvim"
alias cwm="nvim $DOTFILES/.bspwm"

alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='bat'

alias v=openNvim
function openNvim {
  if [ $# -eq 0 ]; then
    nvim ./
  else
    case $1 in
	c)
	    nvim $DOTFILES/nvim
	    ;;
	z)
	    nvim $DOTFILES/.zshrc
	    ;;
	wmd)
	    nvim $DOTFILES/.bspwm
	    ;;
	bsp)
	    nvim $DOTFILES/.bspwm/bspwm/bspwmrc
	    ;;
	sxh)
	    nvim $DOTFILES/.bspwm/sxhkd/sxhkdrc
	    ;;
	*)
	    nvim $1
	    ;;
    esac
  fi
}

function py {
  case $# in
      0)
	  python3
	  ;;
      1)
	  python3 $1
	  ;;
      2)
	  python3 $1 $2
	  ;;
      *)
	  echo 'Use the large command python3'
	  ;;
  esac
}
# Set 'man' colors
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# Change cursor shape for different vi modes.
#function zle-keymap-select {
  #if [[ $KEYMAP == vicmd ]] || [[ $1 = 'block' ]]; then
    #echo -ne '\e[1 q'
  #elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]] || [[ $KEYMAP = '' ]] || [[ $1 = 'beam' ]]; then
    #echo -ne '\e[5 q'
  #fi
#}
#zle -N zle-keymap-select
