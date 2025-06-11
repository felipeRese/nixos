{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;    # make sure zsh support is turned on
    shellAliases = {
      ll  = "ls -la";
      gst = "git status";
      vim = "nvim";
      generate-pr = "(original_dir=$(pwd); cd <CAMINHO_DO_DIRETÓRIO>; npm start -- --original-dir="$original_dir")";
    };

    initExtra = ''
      source ${pkgs.oh-my-zsh}/share/oh-my-zsh.sh
    '';
  };
}
