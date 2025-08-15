{ lib, config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    baseIndex = 1;

    clock24 = true;
    
    shortcut = "Space";

    extraConfig = ''
      set -s escape-time 0
      set-window-option -g mode-keys vi
      bind 'v' copy-mode
    '';

    plugins = with pkgs; [
      tmuxPlugins.catppuccin
    ];
  };
}
