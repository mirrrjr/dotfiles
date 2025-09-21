```bash
vim ~/.local/bin/battery_notify.sh

#!/bin/bash
# Charging/discharging holatini olish
STATUS=$(acpi -b | awk '{print $3}' | tr -d ',')

# Foizni olish
BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')

# Faqat DISCHARGING bo'lsa va foiz < 20
if [ "$STATUS" = "Discharging" ] && [ "$BATTERY_LEVEL" -le 20 ]; then
    notify-send "⚠️ Batareya past" "Zaryad $BATTERY_LEVEL% qoldi"
fi

###

chmod +x .local/bin/battery_notify.sh

###

mkdir -p .config/systemd/user

###

vim ~/.config/systemd/user/battery_notify.service

[Unit]
Description=Battery low notification

[Service]
Type=oneshot
ExecStart=%h/.local/bin/battery_notify.sh

###

vim ~/.config/systemd/user/battery_notify.timer

[Unit]
Description=Run battery notify script every minute

[Timer]
OnBootSec=30
OnUnitActiveSec=60
Unit=battery_notify.service

[Install]
WantedBy=timers.target

###

systemctl --user daemon-reload
systemctl --user enable --now battery_notify.timer
```
