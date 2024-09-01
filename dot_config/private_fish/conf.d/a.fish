# ASDF

if not test -d ~/.asdf
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
end

# SDKMAN

if not test -d ~/.sdkman
    curl -s "https://get.sdkman.io" | bash
end

# GHCUP

if not test -d ~/.ghcup
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
end

# NODE

if not test -d ~/.volta
    curl https://get.volta.sh | bash
end
fish_add_path ~/.volta/bin

if not test -e ~/.volta/bin/node
    volta install node
end

if not test -d ~/.local/share/pnpm
    npm i -g pnpm
end
fish_add_path ~/.local/share/pnpm
set -gx PNPM_HOME ~/.local/share/pnpm

# RUST

if not test -d ~/.cargo
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
end
fish_add_path ~/.cargo/bin

# NEOVIM

if not test -d ~/.local/share/bob
    cargo install bob-nvim
end
fish_add_path ~/.local/share/bob/nvim-bin

if not test -e ~/.local/share/bob/nvim-bin/nvim
    bob use latest
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
end
set -gx EDITOR nvim

# FLY.IO

if not test -d ~/.fly
    curl -L https://fly.io/install.sh | sh
end
fish_add_path ~/.fly/bin

# UTIL

if not test -d ~/.fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
end

if not test -e ~/.cargo/bin/rg
    cargo install ripgrep
end

if not test -e ~/.cargo/bin/rgr
    cargo install repgrep
end

if not test -e ~/.cargo/bin/fd
    cargo install fd-find
end

if not test -e ~/.cargo/bin/bat
    cargo install bat
end
