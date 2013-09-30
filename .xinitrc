# Load NVIDIA settings ~/.nvidia-settings-rc
nvidia-settings --load-config-only

# Keyboard Repeat Delay
xset r rate 250 30

# Remap CapsLock to be another Control Key
setxkbmap -option 'ctrl:nocaps'

# Load ~/.Xresources
xrdb ~/.Xresources

# Start Window Manager
exec awesome
