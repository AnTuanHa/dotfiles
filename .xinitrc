# Start systemd as a user
exec systemd --user &

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

# Set cursor
xsetroot -cursor_name left_ptr &

# Set background image
hsetroot -tile ~/.config/background.jpg &

# Start Window Manager
sxhkd &
[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"
exec bspwm -s "$PANEL_FIFO" -p "W"
