{ lib, config, ... }:

{
  programs.zsh = {
    enable = true;
    initExtra = ''
      export PATH="$HOME/.go"
    '';
  };
}
