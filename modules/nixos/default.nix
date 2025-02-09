{
lib, config, ...
}:

{
  imports = [
    ./hyprland/hyprland.nix
    ./kanata/kanata.nix
    ./tmux/tmux.nix
    ./zsh/zsh.nix
    ./sddm/sddm.nix
  ];
}
