# Custom shortcut'ni export qiliş

```bash
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > ~/.dotfiles/gnome/media-keys.dconf
```

# Custom shortcut'ni import qiliş

```bash
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < ~/.dotfiles/gnome/media-keys.dconf
```
