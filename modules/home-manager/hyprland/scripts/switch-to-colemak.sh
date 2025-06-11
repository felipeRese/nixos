
STATE_FILE="$HOME/.cache/hypr_kb_layout"

if grep -q "colemak" "$STATE_FILE" 2>/dev/null; then
  # ─── Revert to plain US QWERTY ───────────────────────────────────────────────
  if command -v hyprctl &>/dev/null; then
    hyprctl keyword input:kb_layout us                           # redefine layout :contentReference[oaicite:0]{index=0}
    hyprctl keyword input:kb_variant ""                         # clear any variant :contentReference[oaicite:1]{index=1}
  else
    setxkbmap -layout us
  fi
  echo "us" > "$STATE_FILE"
  notify-send "Keyboard Layout" "Switched to US QWERTY"
else
  # ─── Switch to US Colemak-DH ────────────────────────────────────────────────
  if command -v hyprctl &>/dev/null; then
    hyprctl keyword input:kb_layout us
    hyprctl keyword input:kb_variant colemak_dh                  # Colemak-DH variant :contentReference[oaicite:2]{index=2}
  else
    setxkbmap -layout us -variant colemak_dh
  fi
  echo "colemak" > "$STATE_FILE"
  notify-send "Keyboard Layout" "Switched to US Colemak-DH"
fi
