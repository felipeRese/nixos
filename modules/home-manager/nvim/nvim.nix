{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    # Make clangd available to nvim
    extraPackages = with pkgs; [ clang-tools ];
  };
}
