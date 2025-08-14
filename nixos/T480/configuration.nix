{ config, pkgs, inputs, ... }:

let unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  networking.hostName = "T480";

  imports = [
    ./hardware-configuration.nix
    # Include the common module.
    ../../modules/nixos/default.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  services.xserver.displayManager.sddm.wayland.enable = true;

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  programs.zsh.enable = true;

  virtualisation.docker.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "alt-intl";
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Configure console keymap
  console.keyMap = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.felipe = {
    isNormalUser = true;
    description = "Felipe Rese";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      pkgs.zsh
      # thunderbird
    ];
  };

  hardware.keyboard.qmk.enable = true;

  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.variables = {
    GOPATH = "$HOME/go";
    PATH = [
      "$HOME/go/bin"
    ];
  };

  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="6964", ATTRS{idProduct}=="0075", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  environment.stub-ld.enable = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    unstable.mongodb-compass
    unstable.mongodb
    unstable.neovim
    unstable.vimPlugins.luau-lsp-nvim
    home-manager
    google-chrome
    yazi
    exfatprogs
    appimage-run
    gh
    dwt1-shell-color-scripts
    postman
    acpi
    vim  # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    go
    nodejs
    gnumake
    gcc
    kitty
    lf
    tmux
    tinymist
    unstable.dbeaver-bin
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
    slack
    obsidian
    whatsapp-for-linux
    # Hyprland utilities
    waybar
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
    hyprlock
    # Notification
    dunst
    # Wallpaper
    swww
    # App Launcher
    rofi-wayland
    # Network Manager
    networkmanagerapplet
    # Screenshot
    grim
    slurp
    wl-clipboard
    # Color temperature
    redshift
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  programs.ssh.startAgent = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions,
  # on your system were taken. It’s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}

