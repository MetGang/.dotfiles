# Clear this session's history only
HISTFILE=/dev/null
history -c

# Clear console
if [ "$SHLVL" = 1 ]; then
  [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
