{ config, lib, pkgs, ... }:

{
  gtk.enable = true;

  gtk.cursorTheme.package = pkgs.google-cursor;
  gtk.cursorTheme.name = "GoogleDot-Black";

  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk3";


  qt.enable = true;

  qt.platformTheme = "gtk";

  qt.style.name = "adwaita-dark";

  qt.style.package = pkgs.adwaita-qt;
} 
