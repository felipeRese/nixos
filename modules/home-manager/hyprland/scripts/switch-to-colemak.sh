
STATE_FILE="$HOME/.cache/hypr_kb_layout"

if grep -q "intl" "$STATE_FILE" 2>/dev/null; then
  # ─── Revert to plain US QWERTY ───────────────────────────────────────────────
  if command -v hyprctl &>/dev/null; then
    hyprctl keyword input:kb_layout us
    hyprctl keyword input:kb_variant ""
  else
    setxkbmap -layout us
  fi
  echo "us" > "$STATE_FILE"
  notify-send "Keyboard Layout" "Switched to US QWERTY"
else
  # ─── Switch to US International ─────────────────────────────────────────────
  if command -v hyprctl &>/dev/null; then
    hyprctl keyword input:kb_layout us
    hyprctl keyword input:kb_variant intl
  else
    setxkbmap -layout us -variant intl
  fi
  echo "intl" > "$STATE_FILE"
  notify-send "Keyboard Layout" "Switched to US International"
fi
