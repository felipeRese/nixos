{ config, pkgs, inputs, ... }:

let
  # import nixos-unstable from flake inputs, not from <nixos-unstable> channels
  pkgsUnstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in {
  networking.hostName = "felipeRese";

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebengine-5.15.19"
  ];

  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.kernelModules = [ "tun" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.displayManager.sddm.wayland.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  programs.zsh.enable = true;
  programs.steam.enable = true;
  programs.openvpn3.enable = true;

  virtualisation.docker.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "alt-intl";
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  console.keyMap = "us";
  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.felipe = {
    isNormalUser = true;
    description = "Felipe Rese";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ pkgs.zsh ];
  };

  hardware.keyboard.qmk.enable = true;
  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.variables = {
    GOPATH = "$HOME/go";
    PATH = [ "$HOME/go/bin" ];
  };

  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="6964", ATTRS{idProduct}=="0075", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  environment.systemPackages = with pkgs; [
    # pull these from unstable
    pkgsUnstable.codex
    pkgsUnstable.mongodb
    pkgsUnstable.dbeaver-bin

    home-manager
    yazi
    exfatprogs
    appimage-run
    gh
    dwt1-shell-color-scripts
    postman
    acpi
    vim
    wget
    git
    go
    nodejs
    gnumake
    gcc
    kitty
    lf
    tinymist
    postgresql_17_jit
    libnotify
    oh-my-zsh
    lazygit
    geoclue2
    wdisplays
    socat
    vial
    yarn
    pnpm
    nautilus
    notes
    stremio
    blueberry
    gparted
    bun
    docker
    mysql84
    codeblocks
    spotify
    obsidian
    whatsapp-for-linux
    waybar
    hyprlock
    dunst
    swww
    rofi
    networkmanagerapplet
    grim
    slurp
    wl-clipboard
    redshift
  ];

  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  system.stateVersion = "24.11";
}
