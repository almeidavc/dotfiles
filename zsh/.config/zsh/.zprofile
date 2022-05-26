# Autostart X at login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx
fi

export PATH="/home/vicente/.local/share/solana/install/active_release/bin:$PATH"
