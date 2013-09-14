# Load NVIDIA settings ~/.nvidia-settings-rc
nvidia-settings --load-config-only

# Keyboard Repeat Delay
xset r rate 250 30

# Remap CapsLock to Escape
xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x42=Escape'

# Load ~/.Xresources
xrdb ~/.Xresources

# Start Window Manager
exec awesome
