#!/bin/bash

# i3 window manager uchun kerak bo'lgan barcha komponentlarni stow qilish
# Ranglar
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# i3 uchun kerak bo'lgan komponentlar
COMPONENTS=(
    "i3"        # Asosiy window manager
    "polybar"   # Status bar
    "rofi"      # Application launcher
    "picom"     # Compositor (transparency, shadows)
    "alacritty" # Terminal emulator
    "kitty"     # Alternative terminal
    "nvim"      # Text editor
)

echo -e "${BLUE}=== i3 Window Manager Setup ===${NC}"
echo ""

# Stow mavjudligini tekshirish
if ! command -v stow &>/dev/null; then
    echo -e "${RED}❌ Xato: GNU Stow topilmadi!${NC}"
    echo "O'rnatish: sudo apt install stow (Debian/Ubuntu) yoki sudo pacman -S stow (Arch)"
    exit 1
fi

# Dotfiles direktoriyasida ekanligini tekshirish
if [ ! -d ".git" ]; then
    echo -e "${RED}❌ Xato: Dotfiles direktoriyasida emasman!${NC}"
    exit 1
fi

# Har bir komponentni stow qilish
for component in "${COMPONENTS[@]}"; do
    if [ -d "$component" ]; then
        echo -e "${BLUE}📦 Stow qilyapman: ${NC}$component"
        if stow -v "$component" 2>&1 | grep -q "LINK"; then
            echo -e "${GREEN}✓ Muvaffaqiyatli: ${NC}$component"
        else
            stow "$component"
            echo -e "${GREEN}✓ Tayyor: ${NC}$component"
        fi
    else
        echo -e "${RED}⚠ Topilmadi: ${NC}$component (o'tkazib yuborildi)"
    fi
    echo ""
done

echo -e "${GREEN}=== Yakunlandi! ===${NC}"
echo ""
echo -e "${BLUE}Qo'shimcha sozlamalar:${NC}"
echo "1. i3 ni ishga tushirish: Super+Shift+E (logout) keyin i3 ni tanlang"
echo "2. Polybar avtomatik ishga tushadi (i3 config ichida)"
echo "3. Rofi: Super+D (default) yoki sozlangan tugmalar"
echo "4. Sozlamalarni o'zgartirish: ~/.config/i3/config"
echo ""
echo -e "${BLUE}Foydali buyruqlar:${NC}"
echo "• i3 config test: i3 -C"
echo "• i3 restart: Super+Shift+R"
echo "• Polybar restart: killall polybar && polybar &"
