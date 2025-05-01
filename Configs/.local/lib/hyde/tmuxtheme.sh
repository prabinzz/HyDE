#!/bin/bash

# Script to sync Tmux colors with Hyprland theme
# Save this file as ~/.config/hypr/scripts/tmux-theme.sh and make it executable

# Function to extract colors from Hyprland config
get_hyprland_colors() {
  # Default path to Hyprland colors file
  colors_file="$HOME/.config/hypr/colors.conf"

  # Check if HyDE uses a different colors location
  if [ -f "$HOME/.config/hypr/themes/current.conf" ]; then
    colors_file="$HOME/.config/hypr/themes/current.conf"
  fi

  # Extract colors - adjust these patterns based on actual HyDE config format
  background=$(grep -oP '^\$background\s*=\s*\K[^$]+' "$colors_file" 2>/dev/null || echo "#1e1e2e")
  foreground=$(grep -oP '^\$foreground\s*=\s*\K[^$]+' "$colors_file" 2>/dev/null || echo "#cdd6f4")
  accent=$(grep -oP '^\$accent\s*=\s*\K[^$]+' "$colors_file" 2>/dev/null || echo "#89b4fa")
  text=$(grep -oP '^\$text\s*=\s*\K[^$]+' "$colors_file" 2>/dev/null || echo "#cdd6f4")
  inactive=$(grep -oP '^\$inactive\s*=\s*\K[^$]+' "$colors_file" 2>/dev/null || echo "#6c7086")

  # Clean up any whitespace
  background=$(echo "$background" | xargs)
  foreground=$(echo "$foreground" | xargs)
  accent=$(echo "$accent" | xargs)
  text=$(echo "$text" | xargs)
  inactive=$(echo "$inactive" | xargs)
}

# Function to update tmux colors
update_tmux_colors() {
  # Get current Hyprland colors
  get_hyprland_colors

  # Apply colors to tmux
  tmux_commands="
        set -g status-style bg=$background,fg=$text
        setw -g window-status-format '#[fg=$inactive,bg=$background] #I #W '
        setw -g window-status-current-format '#[fg=$text,bg=$accent,bold] #I #W '
        set -g status-right '#[fg=$text,bg=$accent] %H:%M '
        set -g pane-border-style fg=$inactive
        set -g pane-active-border-style fg=$accent
    "

  # Apply settings if tmux is running
  if tmux info &>/dev/null; then
    echo "$tmux_commands" | tmux source-file -
  fi

  # Save to tmux theme file for loading on start
  echo "$tmux_commands" >"$HOME/.tmux-theme"
}

# Update colors now
update_tmux_colors

# Add this to your Hyprland config to update on theme change:
# exec-once = ~/.config/hypr/scripts/tmux-theme.sh
# exec = pkill -USR1 -x tmux-theme.sh || ~/.config/hypr/scripts/tmux-theme.sh
