{ lib, config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    baseIndex = 1;

    clock24 = true;
    
    shortcut = "Space";

    plugins = with pkgs; [
      tmuxPlugins.catppuccin
      

    ];


  };
}
