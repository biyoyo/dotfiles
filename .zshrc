autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats "%F{10}(%b)%f"
precmd() {
    vcs_info
}

# Enable substitution in the prompt.
setopt prompt_subst

# Set up the prompt
autoload -Uz promptinit
promptinit
#PROMPT='%F{red}%1~ %# '
#PROMPT='%B%F{240}%1~%f%b %# '
#PROMPT='%B%F{$((RANDOM % 256 + 1))}%n %b%f%# '
PROMPT='%B%F{75}Bilyana%f %F{3}√ %F{161}%1~%f%b ${vcs_info_msg_0_} '
RPROMPT='[%B%F{88}%?%b%f][%B%*%b]'

setopt histignorealldups 

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Use modern completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt COMPLETE_ALIASES

#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true

#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#options
setopt AUTO_CD
#setopt CORRECT
#setopt CORRECT_ALL

#aliases
alias ll='ls -lh1Ng --color=auto'
alias ls='ls --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias x='clear'
alias dup='gnome-terminal&>/dev/null&;disown'
alias grep='grep -in --color --exclude-dir=.venv'
alias gswc='git switch -c '
alias glog='git log '
alias gsw='git switch '

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# History
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "\e[A" up-line-or-beginning-search
bindkey "\e[B" down-line-or-beginning-search
bindkey "^R" history-incremental-search-backward

#new keybindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-delete-word

# disable terminal freeze
stty -ixon
unsetopt BEEP

# enable vim key bindings
bindkey -v
