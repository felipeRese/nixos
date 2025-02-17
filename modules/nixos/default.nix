{
lib, config, ...
}:

{
  imports = [
    ./hyprland/hyprland.nix
    ./kanata/kanata.nix
    ./tmux/tmux.nix
    ./sddm/sddm.nix
    ./zsh/zsh.nix
  ];
}
