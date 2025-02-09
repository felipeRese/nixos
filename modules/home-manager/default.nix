{
lib, config, ...
}:

{
  imports = [
    ./waybar/waybar.nix
    ./hyprland/hyprland.nix
    ./rofi/rofi.nix
    ./catppuccin/catppuccin.nix
    ./hyprlock/hyprlock.nix
    ./theme/theme.nix
  ];
}
