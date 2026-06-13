#!/usr/bin/env bash

set -euo pipefail

echo "===> Installing Neovim formatters..."

has_command() {
	command -v "$1" >/dev/null 2>&1
}

install_npm_formatters() {
	echo "===> Installing prettier and blade-formatter..."

	npm install -g prettier blade-formatter

	echo "✓ prettier installed"
	echo "✓ blade-formatter installed"
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

echo

# npm tools
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

echo
echo "===> Installed versions"
echo

has_command prettier && prettier --version
has_command blade-formatter && blade-formatter --version || true
has_command stylua && stylua --version || true
has_command shfmt && shfmt --version || true
has_command pint && pint --version || true

echo
echo "Done."
