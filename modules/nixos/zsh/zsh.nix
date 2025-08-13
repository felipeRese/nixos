{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    oh-my-zsh = {
      enable = true;

      plugins = [
        "aliases"
        "alias-finder"
        "colored-man-pages"
        "colorize"
        "docker"
        "docker-compose"
        "fzf"
        "git"
        "golang"
        "kitty"
        "npm"
        "themes"
        "sudo"
        "zsh-interactive-cd"
      ];

      theme = "cloud";
    };

    shellInit = ''
      eval "$(zoxide init zsh)"
      if command -v keychain > /dev/null 2>&1; then eval $(keychain --eval --nogui ~/.ssh/bitbucket ~/.ssh/id_ed25519 --quiet); fi     
    '';
  };

  environment.shellAliases = {
    ll  = "ls -alhF";
    gs  = "git status";
    vim = "nvim";
    c = "clear";
    crun = "bash ~/nixos/modules/nixos/zsh/crun.sh";
    cd = "z";

    generate-pr = ''
      (original_dir=$(pwd); cd ~/Programming/bitbucket-pull-request-generator; \
      npm start -- --original-dir="$original_dir")
    '';
  };

  environment.variables = {
    GOPRIVATE = "git@bitbucket.org:tech-utua/*,bitbucket.org/tech-utua/*";
  };
}

