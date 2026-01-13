{
  pkgs,
  config,
  username,
  ...
}: {
  programs = {
    chromium = {
      enable = true;
      commandLineArgs = ["--enable-features=TouchpadOverscrollHistoryNavigation"];
      extensions = [
        {id = "dbepggeogbaibhgnhhndojpepiihcmeb";}
        {id = "gjjbmfigjpgnehjioicaalopaikcnheo";}
        {id = "aimiinbnnkboelefkjlenlgimcabobli";}
        # {id = "";}  // extension id, query from chrome web store
      ];
    };

    firefox = {
      enable = true;
      profiles.${username} = {};
    };
  };
}
