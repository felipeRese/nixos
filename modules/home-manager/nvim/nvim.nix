{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    # Make clangd available to nvim
    extraPackages = with pkgs; [ clang-tools ];
  };
  # Optional: useful C/C++ tools for LSP
  home.packages = with pkgs; [ gcc gdb bear llvmPackages.clang ];
}
