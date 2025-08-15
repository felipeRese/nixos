{ config, system, pkgs, inputs, ... }:
{
  imports = [
    ../modules/home-manager/default.nix
  ];
  home.username = "felipe";
  home.homeDirectory = "/home/felipe";

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 8;
    "Xft.dpi" = 172;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
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
    copyq
    python313Packages.pip
    zathura
    openvpn
    kanata
    pavucontrol
    jetbrains.goland
    jetbrains.datagrip
    skaffold
    minikube
    kubectl
    ytermusic
    google-cloud-sql-proxy
    google-cloud-sdk
    go-swag
    super-productivity
    fselect
    uutils-coreutils-noprefix
    zoxide
    starship
    ncspot
    tokei
    xh
    zellij
    keychain
    air
    exfat
    fuse
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
    nnn

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep
    jq
    yq-go
    eza
    fzf

    # networking tools
    mtr
    iperf3
    dnsutils
    ldns
    aria2
    socat
    nmap
    ipcalc

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
    nix-output-monitor

    # productivity
    hugo
    glow

    btop
    iotop
    iftop

    # system call monitoring
    strace
    ltrace
    lsof

    # system tools
    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils

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

    # ---------- LaTeX (minimal but complete) ----------  <-- ADDED
    (pkgs.texlive.combine {
      inherit (pkgs.texlive)
        # base scheme + latexmk
        scheme-small
        latexmk

        # core LaTeX collections most docs expect
        collection-basic
        collection-latex
        collection-latexrecommended
        collection-fontsrecommended

        # commonly used packages (adjust as you add \usepackage{...})
        amsmath
        geometry
        hyperref
        xcolor
        cmap
        csquotes;

      # If you prefer XeLaTeX/LuaLaTeX later, also add:
      # inherit (pkgs.texlive) xetex lualatex;
    })
    # ---------------------------------------------------
  ];

  fonts.fontconfig.enable = true;

  programs.git = {
    enable = true;
    userName = "felipeRese";
    userEmail = "feliperese2018@gmail.com";
    extraConfig = {
      url."git@github.com:".insteadOf = "https://github.com/";
      url."git@bitbucket.org:".insteadOf = "https://bitbucket.org/";
    };
  };

  programs.starship = {
    enable = true;
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

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
