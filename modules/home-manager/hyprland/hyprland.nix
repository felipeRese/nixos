{ pkgs, lib, inputs, ... }: 
                                                                          
{
  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [ ];

    settings = {
      monitor = [
        "DP-3, 2560x1440@144, 0x0, 1" 
        "HDMI-A-1, 1920x1080@75, 2560x0, 1" 
        # "eDP-1, 1920x1080@60, 0x0, 1"
      ];
      env = [
        "HYPRCURSOR_THEME,GoogleDot-Black"
        "XCURSOR_THEME,GoogleDot-Black"
        "XCURSOR_SIZE, 22"
        "HYPRCURSOR_SIZE, 22"
      ];

      # Define your main modifier.
      "$mod" = "SUPER";

      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 0;

        layout = "dwindle";
      };

      gestures = {
        workspace_swipe = true;
      };

      decoration = {
        active_opacity   = 1;
        inactive_opacity = 1;

        blur = {
          enabled = true;
          size    = 5;
          passes  = 1;
          vibrancy = 0.1696;
        };
      };
      
      bind = [
        # Open kitty terminal
        "$mod, RETURN, exec, kitty"

        # Close active window
        "$mod, Q, killactive"

        # Toggle Floating
        "$mod, V, togglefloating"

        # Open menu
        "$mod, Space, exec, rofi -show drun -show-icons"

        # Lock screen
        "$mod, x, exec, hyprlock"

        # Set fullscreen
        "$mod, F, fullscreen"

        #restart hyprland
        "$mod, M, exit"

        # Screenshot
        ''$mod, S, exec, grim -l 0 -g "$(slurp)" - | wl-copy''

        # Night light
        "$mod, p, exec, redshift -l -23.5505:-46.6333 -t 6500:3000"

        "$mod, Y, exec, ~/nixos/modules/home-manager/hyprland/scripts/switch-to-colemak.sh"


        # Move focus with mainMod + arrow keys
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        # Switch workspaces with mainMod + [0-9]
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

      ];

      bindm = [
        # Mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      "exec-once" = [
        "bash ~/nixos/modules/home-manager/hyprland/scripts/start.sh"
      ];
    };
  };
}

