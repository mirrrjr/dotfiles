#!/usr/bin/env bash

set -euo pipefail

echo "===> Installing Neovim formatters..."

has_command() {
	command -v "$1" >/dev/null 2>&1
}

install_npm_formatters() {
	echo "===> Installing prettier, blade-formatter, sql-formatter..."

	npm install -g prettier blade-formatter sql-formatter

	echo "✓ prettier installed"
	echo "✓ blade-formatter installed"
	echo "✓ sql-formatter installed"
}

install_pint() {
	echo "===> Installing Laravel Pint..."

	composer global require laravel/pint

	echo "✓ pint installed"
	echo "Make sure Composer global bin directory is in PATH"
}

install_stylua() {
	echo "===> Installing stylua..."

	if has_command pacman; then
		sudo pacman -S --needed stylua
	elif has_command cargo; then
		cargo install stylua
	fi

	echo "✓ stylua installed"
}

install_shfmt() {
	echo "===> Installing shfmt..."

	if has_command pacman; then
		sudo pacman -S --needed shfmt
	elif has_command go; then
		go install mvdan.cc/sh/v3/cmd/shfmt@latest
	else
		echo "✗ Neither pacman nor Go found"
		echo "Install Go: https://go.dev/doc/install"
		return
	fi

	echo "✓ shfmt installed"
}

install_gofumpt() {
	echo "===> Installing gofumpt..."

	if has_command go; then
		go install mvdan.cc/gofumpt@latest
		echo "✓ gofumpt installed"
		echo "Make sure $(go env GOPATH)/bin is in PATH"
	else
		echo "✗ Go not found"
		echo "Install Go: https://go.dev/doc/install"
	fi
}

install_ruff() {
	echo "===> Installing ruff..."

	if has_command pacman; then
		sudo pacman -S --needed ruff
	elif has_command pip; then
		pip install --break-system-packages ruff
	elif has_command pip3; then
		pip3 install --break-system-packages ruff
	else
		echo "✗ Neither pacman nor pip found"
		echo "Install Python: https://www.python.org/downloads/"
		return
	fi

	echo "✓ ruff installed"
}

echo

# npm tools (prettier, blade-formatter, sql-formatter)
if has_command npm; then
	install_npm_formatters
else
	echo "✗ npm not found"
	echo "Install Node.js: https://nodejs.org/en/download"
	echo
fi

# composer tools
if has_command composer; then
	install_pint
else
	echo "✗ composer not found"
	echo "Install Composer: https://getcomposer.org/download/"
	echo
fi

# stylua
if has_command pacman || has_command cargo; then
	install_stylua
else
	echo "✗ stylua cannot be installed"
	echo "Install Rust: https://www.rust-lang.org/tools/install"
	echo
fi

# shfmt
install_shfmt

# gofumpt
install_gofumpt

# ruff
install_ruff

echo
echo "===> Installed versions"
echo

has_command prettier && prettier --version || true
has_command blade-formatter && blade-formatter --version || true
has_command sql-formatter && sql-formatter --version || true
has_command stylua && stylua --version || true
has_command shfmt && shfmt --version || true
has_command pint && pint --version || true
has_command gofumpt && gofumpt --version || true
has_command ruff && ruff --version || true

echo
echo "Done."
