{ config, system, pkgs, inputs, ... }:
{
  imports = [
    ../modules/home-manager/default.nix
  ];
  home.username = "felipe";
  home.homeDirectory = "/home/felipe";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 8;
    "Xft.dpi" = 172;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };


programs.tmux = {
  enable = true;
  extraConfig = ''
    set -s escape-time 0
  '';
};

programs.yazi = {
  enable = true;
  settings = {
    manager = {
      show_hidden = true;
    };
  };
};

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    exfat
    fuse
    ventoy-full
    jetbrains.idea-ultimate
    jetbrains.idea-community-bin
    lua-language-server
    inxi
    gdb
    delve
    vimPlugins.clangd_extensions-nvim
    clang-tools
    wayvnc
    lua-language-server
    rustup
    typst
    air
    wleave
    curl
    python312Packages.pynvim
    python312Packages.requests-ntlm
    k6
    stremio
    python312
    pipx
    python313Packages.pip
    python312Packages.flask

    
    neofetch
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    tinymist
    lua-language-server

    # fonts
    nerd-fonts.jetbrains-mono

    glib
    gobject-introspection
    nss
    nspr
    dbus
    atk
    cairo
    pango
    cups
    expat
    libxkbcommon
  ];

  fonts.fontconfig.enable = true;

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "felipeRese";
    userEmail = "feliperese2018@gmail.com";
    extraConfig = {
      url."git@github.com:".insteadOf = "https://github.com/";
      url."git@bitbucket.org:".insteadOf = "https://bitbucket.org/";
    };
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };
  
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
