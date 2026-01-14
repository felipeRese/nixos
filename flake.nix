{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };

    # ✅ Codex (pinned via flake.lock)
    codex.url = "github:sadjow/codex-nix";
    codex.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      T480 =
        let
          username = "feliperese";
          system = "x86_64-linux";

          # Include inputs so NixOS modules can access `inputs.codex` too (optional but useful)
          specialArgs = { inherit username inputs; };
        in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          inherit system;

          modules = [
            ./hosts/T480
            ./users/${username}/nixos.nix

            # ✅ Option 1: install Codex system-wide (available for all users)
            ({ pkgs, ... }: {
              environment.systemPackages = [
                inputs.codex.packages.${system}.default
              ];
            })

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };
    };
  };
}
