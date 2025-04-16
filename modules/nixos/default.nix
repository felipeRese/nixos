{
lib, config, ...
}:

{
  imports = [
    ./hyprland/hyprland.nix
    ./tmux/tmux.nix
    ./sddm/sddm.nix
    ./zsh/zsh.nix
  ];
}
