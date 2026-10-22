#!/bin/sh
# Render diagram SVG sources to ../images/*.png at 2x (requires chromium)
cd "$(dirname "$0")"
for f in ${@:-*.svg}; do
  w=$(grep -o 'width="[0-9]*"' "$f" | head -1 | tr -dc 0-9)
  h=$(grep -o 'height="[0-9]*"' "$f" | head -1 | tr -dc 0-9)
  chromium --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=2 \
    --window-size="$w,$h" --screenshot="$PWD/../images/${f%.svg}.png" "file://$PWD/$f" 2>/dev/null
done
