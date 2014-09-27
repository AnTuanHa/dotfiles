# Start systemd as a user
# exec systemd --user &

# Load NVIDIA settings ~/.nvidia-settings-rc
nvidia-settings --load-config-only

# Keyboard Repeat Delay
xset r rate 250 30

# Remap CapsLock to be another Control Key
setxkbmap -option 'ctrl:nocaps'

# Load ~/.Xresources
xrdb ~/.Xresources

# Start compositing manager
compton &

# Start notification daemon
dunst &

# Set cursor
xsetroot -cursor_name left_ptr &

# Set background image
feh --no-fehbg --bg-scale ~/.config/screenshots/scorched_earth.png &

# Add uushi and lemon fonts
xset +fp ~/.fonts/
xset fp rehash

# Start Window Manager
sxhkd -f 100 &
exec bspwm -s "$PANEL_FIFO" -p "W"
