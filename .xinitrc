# Remap CapsLock to Escape
xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x42=Escape'

# Start Window Manager
exec i3
