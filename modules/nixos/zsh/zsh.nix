{ lib, config, ... }:

{
  programs.zsh = {
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
}
