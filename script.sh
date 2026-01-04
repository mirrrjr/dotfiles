#!/bin/bash

set -e

# === Sozlamalar ===
NERD_FONT_NAME="JetBrainsMono"
NERD_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${NERD_FONT_NAME}.zip"
EMOJI_FONT_URL="https://noto-website-2.storage.googleapis.com/pkgs/NotoColorEmoji-unhinted.zip"
FONT_DIR="$HOME/.local/share/fonts"
TMP_DIR="/tmp/fonts-install"

# === Tayyorlov ===
mkdir -p "$FONT_DIR"
mkdir -p "$TMP_DIR"

# === Nerd Font yuklash ===
echo "🔤 Yuklab olinmoqda: $NERD_FONT_NAME..."
wget -O "$TMP_DIR/${NERD_FONT_NAME}.zip" "$NERD_FONT_URL"

echo "📦 Ochilmoqda: $NERD_FONT_NAME..."
unzip -o "$TMP_DIR/${NERD_FONT_NAME}.zip" -d "$FONT_DIR"

# === Emoji Font yuklash ===
echo "😊 Yuklab olinmoqda: Noto Color Emoji..."
wget -O "$TMP_DIR/NotoColorEmoji.zip" "$EMOJI_FONT_URL"

echo "📦 Ochilmoqda: Noto Color Emoji..."
unzip -o "$TMP_DIR/NotoColorEmoji.zip" -d "$TMP_DIR"

# Faqat kerakli .ttf faylni ko‘chir
find "$TMP_DIR" -name "NotoColorEmoji.ttf" -exec cp {} "$FONT_DIR" \;

# === Font cache yangilash ===
echo "🔄 Font cache yangilanmoqda..."
fc-cache -f "$FONT_DIR"

# === Tozalash ===
rm -rf "$TMP_DIR"

echo "✅ Barcha fontlar o‘rnatildi va tizimga tayyor!"

