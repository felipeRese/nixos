{ config, pkgs, ... }:

{
  home.file = {

    # Minimal Waybar config
    ".config/waybar/config.jsonc" = {
      text = ''
        // -*- mode: jsonc -*-
        {
          "layer": "top",
          "position": "top",
          // auto height
          "spacing": 2,
          "modules-left": [
            "hyprland/workspaces"
          ],
          "modules-center": [
            "hyprland/window"
          ],
          "modules-right": [
            "tray",
            "battery",
            "network",
            "cpu",
            "memory",
            "pulseaudio",
            "clock"
          ],
          "include": [
            "~/.config/waybar/modules.json"
          ]
        }
      '';
    };

    # Modules definitions
    ".config/waybar/modules.json" = {
      text = ''
        {
          "hyprland/workspaces": {
            "disable-scroll": true,
            "all-outputs": true,
            "format": "{name}",
            "format-icons": {
              "active": "",
              "default": ""
            }
          },
          "hyprland/window": {
            "format": "{title}"
          },
          "tray": {},

          "battery": {
            "format": "{icon} {capacity}%",
            "format-charging": " {capacity}%",
            "format-full": " {capacity}%",
            "tooltip": false,
            "format-icons": ["","","","",""]
          },

          "network": {
            "format-wifi": " {signalStrength}%",
            "tooltip": false
          },

          "cpu": {
            "format": " {usage}%",
            "tooltip": false
          },

          "memory": {
            "format": " {usage}%",
            "tooltip": false
          },

          "pulseaudio": {
            "format": " {volume}%",
            "tooltip": false,
            "on-click": "pavucontrol"
          },

          "clock": {
            "format": "{:%H:%M}",
            "tooltip": false
          }
        }
      '';
      executable = true;
    };

    # Thin, zero-padding stylesheet with gray background, white text, and icon–text margin
    ".config/waybar/style.css" = {
      text = ''
        * {
          font-family: "JetBrainsMonoNF";
          color: white;
          font-size: 12px;
        }

        /* add space between icon and text */
        .icon {
          margin-right: 4px;
        }

        window#waybar {
          background: #1e1e2e;
          color: #ffffff;
        }

        .modules-left,
        .modules-center,
        .modules-right {
          background: transparent;
          margin: 0;
          padding: 0;
          border-radius: 0;
        }

        #workspaces button,
        #window,
        #tray,
        #battery,
        #network,
        #cpu,
        #memory,
        #pulseaudio,
        #clock {
          padding: 0 5px;
          border-radius: 0;
        }

        #workspaces button.active {
          background: rgba(255,255,255,0.1);
        }

        #workspaces button:hover {
          background: rgba(255,255,255,0.15);
        }
      '';
    };

  };
}
