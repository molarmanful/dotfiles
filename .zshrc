# lol nah
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# ZSH
export ZSH="$HOME/.oh-my-zsh"
[[ -d $ZSH ]] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
gs=(zsh-users/zsh-autosuggestions z-shell/F-Sy-H lukechilds/zsh-nvm)
for g in "${gs[@]}"; do
  d="$ZSH/custom/plugins/$(echo $g | sed 's:.*/::')"
  [[ -d $d ]] || git clone https://github.com/$g $d
done

# SDK
export SDKMAN_DIR="$HOME/.sdkman"
[[ -d $SDKMAN_DIR ]] || curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# SCALA
(( $+commands[cs] )) || (curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d > cs && ./cs setup)

# ASDF
[[ -d "$HOME/.asdf" ]] || git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1

# HASKELL
[[ -d "$HOME/.ghcup" ]] || curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
source "$HOME/.ghcup/env"
(( $+commands[ghc] )) || (ghcup install ghc && ghcup install stack)

# NODE
export VOLTA_HOME="$HOME/.volta"
[[ -d $VOLTA_HOME ]] || curl https://get.volta.sh | bash
export PATH="$VOLTA_HOME/bin:$PATH"
(( $+commands[node] )) || volta install node
export PNPM_HOME="$HOME/.local/share/pnpm"
[[ -d $PNPM_HOME ]] || npm i -g pnpm
export PATH="$HOME/.local/bin:$PNPM_HOME:$PATH"

# FLY.IO
export FLYCTL_INSTALL="$HOME/.fly"
[[ -d $FLYCTL_INSTALL ]] || curl -L https://fly.io/install.sh | sh
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# RUST
(( $+commands[rustup] )) || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# NEOVIM
export BOB_DIR="$HOME/.local/share/bob"
[[ -d $BOB_DIR ]] || cargo install bob-nvim
export PATH="$BOB_DIR/nvim-bin:$PATH"
(( $+commands[nvim] )) || (bob use latest && git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1)
export EDITOR=nvim

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/benji/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

HYPHEN_INSENSITIVE="true"

plugins=(common-aliases git F-Sy-H zsh-autosuggestions z history colored-man-pages extract vscode asdf)

source $ZSH/oh-my-zsh.sh

# GOLANG
(( $+commands[go] )) || (asdf plugin add golang && asdf install golang latest && asdf global golang latest)
. ~/.asdf/plugins/golang/set-env.zsh

# LSPs
(( $+commands[haskell-language-server-wrapper] )) || ghcup install hls
(( $+commands[shellcheck] )) || (stack install shellcheck && cargo install shellharden)
(( $+commands[shfmt] )) || (go install mvdan.cc/sh/v3/cmd/shfmt@latest && asdf reshim golang)
(( $+commands[eslint] )) || pnpm i -g eslint prettier vscode-langservers-extracted
(( $+commands[stylelint] )) || pnpm i -g stylelint stylelint-lsp
(( $+commands[svelte-language-server] )) || pnpm i -g svelte-language-server unocss-language-server
(( $+commands[lua-language-server] )) || (asdf plugin add lua-language-server && asdf install lua-language-server latest && asdf global lua-language-server latest && cargo install stylua)
(( $+commands[metals] )) || cs install metals scalafmt

# GITSTATUS
[[ -f ~/gitstatus/gitstatus.prompt.zsh ]] || git clone --depth=1 https://github.com/romkatv/gitstatus.git ~/gitstatus
source ~/gitstatus/gitstatus.prompt.zsh

# SYNC
(( $+commands[chezmoi] )) || (asdf plugin add chezmoi && asdf install chezmoi latest && asdf global chezmoi latest && chezmoi init --apply molarmanful)

# RIGHT PROMPT
bindkey -e
precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
  RPS1=$'${${KEYMAP/vicmd/NORMAL}/(main|viins)/} %{$fg_bold[yellow]%}%~%{$reset_color%} $GITSTATUS_PROMPT%{$reset_color%}'
  zle reset-prompt
}

# KEYMAP
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

ZSH_THEME_GIT_PROMPT_PREFIX=" @ "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "

# LEFT PROMPT
export PS1=$'%{$(tput cup $(tput cols))%B%(?.%F{cyan}.%F{red})%}λ%{\e[0m%} '
export PS2=$'   '

# ALIASES
alias ls='ls -Ga'
alias v='nvim'
alias vim='nvim'

# LIFTOFF
tput cvvis
