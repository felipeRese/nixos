{ pkgs, config, ... }:

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

    extraConfig = ''
      include ${config.xdg.configHome}/kitty/catppuccin-mocha.conf
    '';
  };

  xdg.configFile."kitty/catppuccin-mocha.conf".text = ''
    foreground              #cdd6f4
    background              #1e1e2e
    selection_foreground    #1e1e2e
    selection_background    #f5e0dc
    cursor                  #f5e0dc
    cursor_text_color       #1e1e2e
    url_color               #f5e0dc

    active_border_color     #b4befe
    inactive_border_color   #6c7086
    bell_border_color       #f9e2af

    active_tab_foreground   #1e1e2e
    active_tab_background   #cba6f7
    inactive_tab_foreground #cdd6f4
    inactive_tab_background #181825
    tab_bar_background      #11111b

    mark1_foreground        #1e1e2e
    mark1_background        #b4befe
    mark2_foreground        #1e1e2e
    mark2_background        #cba6f7
    mark3_foreground        #1e1e2e
    mark3_background        #74c7ec

    color0  #45475a
    color1  #f38ba8
    color2  #a6e3a1
    color3  #f9e2af
    color4  #89b4fa
    color5  #f5c2e7
    color6  #94e2d5
    color7  #bac2de
    color8  #585b70
    color9  #f38ba8
    color10 #a6e3a1
    color11 #f9e2af
    color12 #89b4fa
    color13 #f5c2e7
    color14 #94e2d5
    color15 #a6adc8

    color16 #fab387
    color17 #f5e0dc
  '';
}
