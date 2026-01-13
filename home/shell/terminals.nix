{ pkgs, ... }:

# terminals

let
  font = "JetBrainsMono Nerd Font";
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 1;
      window.padding = {
        x = 0;
        y = 0;
      };
      scrolling.history = 10000;

      font = {
        normal.family = font;
        bold.family = font;
        italic.family = font;
        size = 11;
      };

    };
  };
}
