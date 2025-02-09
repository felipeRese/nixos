{ lib, ... }:

{
  services.displayManager.sddm = {
    enable = true; # Enable SDDM.
    sugarCandyNix = {
        enable = true; 
        settings = {
          Background = lib.cleanSource ../../../public/wallpaper/wallpaper.png;
          ScreenWidth = 1920;
          ScreenHeight = 1080;
          FormPosition = "left";
          HaveFormBackground = true;
          PartialBlur = true;
        };
      };
    };
  }
