{pkgs, ...}: {
  imports = [
    ../../home/core.nix

    ../../home/i3
    ../../home/programs
    ../../home/rofi
    ../../home/shell
    ../../home/shell/nushell
  ];


  programs.git = {
    userName = "Felipe Rese";
    userEmail = "feliperese2018@gmail.com";
    url."git@bitbucket.org:".insteadOf = "https://bitbucket.org/";
  };
}
