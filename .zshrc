export ZSH="$HOME/.oh-my-zsh"
export EDITOR=vim
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/benji/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

HYPHEN_INSENSITIVE="true"

plugins=(common-aliases git F-Sy-H zsh-autosuggestions z history colored-man-pages extract vscode zsh-nvm)

source $ZSH/oh-my-zsh.sh
source ~/gitstatus/gitstatus.prompt.zsh

bindkey -e
precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
  RPS1=$'${${KEYMAP/vicmd/NORMAL}/(main|viins)/} %{$fg_bold[yellow]%}%~%{$reset_color%} $GITSTATUS_PROMPT%{$reset_color%}'
  zle reset-prompt
}

bindkey "jk" vi-cmd-mode
bindkey "kj" vi-cmd-mode
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241"

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish

alias ls='ls -Ga'

ZSH_THEME_GIT_PROMPT_PREFIX=" @ "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "

export PS1=$'%{$(tput cup $(tput cols))%B%(?.%F{cyan}.%F{red})%}λ%{\e[0m%} '
export PS2=$'   '

clear
tput cvvis