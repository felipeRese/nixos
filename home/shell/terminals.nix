{ pkgs, ... }:

let
  font = "JetBrainsMono Nerd Font";
in
{
  programs.kitty = {
    enable = true;

    font = {
      name = font;
      size = 11;
    };

    settings = {
      # Window
      background_opacity = "1.0";
      window_padding_width = 0;

      # Scrollback
      scrollback_lines = 10000;

      # Shell (start directly in Nushell)
      shell = "nu";
    };
  };
}
