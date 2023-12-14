# CHEZMOI

if not test -d ~/.asdf/plugins/chezmoi
  asdf plugin add chezmoi
    and asdf install chezmoi latest
    and asdf global chezmoi latest
  chezmoi init --apply molarmanful
end

# SCALA

if not test -d ~/.asdf/plugins/coursier
  sdk i java
  asdf plugin add coursier
    and asdf install coursier latest
    and asdf global coursier latest
  coursier install metals scalafmt
end

# HASKELL

if not test -e ~/.ghcup/bin/stack
  ghcup install ghc recommended
    and ghcup install stack recommended
    and stack update
end

# CMAKE

if not test -d ~/.asdf/plugins/cmake
  asdf plugin add cmake
    and asdf install cmake latest
    and asdf global cmake latest
end

# GOLANG

if not test -d ~/.asdf/plugins/golang
  asdf plugin add golang 
    and asdf install golang latest 
    and asdf global golang latest
end
. ~/.asdf/plugins/golang/set-env.fish

if not test -e ~/.asdf/shims/golines
  go install golang.org/x/tools/cmd/goimports@latest
    and go install github.com/segmentio/golines@latest
    and asdf reshim golang
end

# USER

function _my_postexec --on-event fish_postexec
  set -l last_status $pipestatus
  set -g _my_status_c "$_hydro_color_prompt"
  set -g _my_status_e ""

  for code in $pipestatus
    if test $code -ne 0
      set -g _my_status_c "$_hydro_color_error"
      set -g _my_status_e "$_hydro_color_error"(echo $last_status)" | "
      break
    end
  end
end

fish_add_path ~/.local/bin

set -g hydro_symbol_prompt ∫
set -g hydro_color_prompt cyan
set -g hydro_color_pwd yellow
set -g hydro_color_git green
set -g hydro_color_duration blue
