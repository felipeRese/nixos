{ lib, config, ... }:

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
  };
  
environment.shellAliases = {
  ll  = "ls -alhF";
  gs  = "git status";
  vim = "nvim";
  c = "clear";
  crun = "bash ~/nixos/modules/nixos/zsh/crun.sh";

  generate-pr = ''
    (original_dir=$(pwd); cd ~/Programming/bitbucket-pull-request-generator; \
    npm start -- --original-dir="$original_dir")
  '';
};
}
