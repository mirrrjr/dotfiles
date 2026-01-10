# Install some dependencies for LSP

```bash
# via npm
npm install -g typescript typescript-language-server vscode-langservers-extracted \
                tailwindcss-language-server intelephense dockerfile-language-server-nodejs \
                yaml-language-server marksman vtsls

# Rust
rustup component add rust-analyzer

# Go 
go install golang.org/x/tools/gopls@latest
go install github.com/lighttiger2505/sqls@latest

# Lua
brew install lua-language-server

# Ubuntu/Debian
sudo apt install lua-language-server

```


