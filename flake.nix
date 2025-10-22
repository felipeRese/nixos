{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    # SDDM
    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    catppuccin.url = "github:catppuccin/nix";

    # Stylix (input present, but do NOT import its Home Manager module from the flake)
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, sddm-sugar-candy-nix, stylix, ... }@inputs: {

    nixosConfigurations = {
      # Configuration for your default machine (e.g. your notebook)
      T480 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/T480/configuration.nix

          sddm-sugar-candy-nix.nixosModules.default
          {
            nixpkgs = {
              overlays = [
                sddm-sugar-candy-nix.overlays.default
              ];
            };
          }

          # Keep the Stylix NixOS module available if you want system-level activation
          stylix.nixosModules.stylix

          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.felipe = {
              imports = [
                catppuccin.homeManagerModules.catppuccin
                ./home-manager/home.nix
                # NOTE: removed `stylix.homeManagerModules.stylix` here to avoid Home Manager option mismatches
              ];
            };
            home-manager.extraSpecialArgs = {
              inherit inputs;
              system = "x86_64-linux";
            };
          }
        ];
        specialArgs = { inherit inputs; };
      };

      # Configuration for your desktop (includes desktop-specific settings)
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/desktop/configuration.nix

          sddm-sugar-candy-nix.nixosModules.default
          {
            nixpkgs = {
              overlays = [
                sddm-sugar-candy-nix.overlays.default
              ];
            };
          }

          # Stylix NixOS module (optional/system-level)
          stylix.nixosModules.stylix

          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.felipe = {
              imports = [
                catppuccin.homeManagerModules.catppuccin
                ./home-manager/home.nix
                # NOTE: stylix.homeManagerModules.stylix removed here as well
              ];
            };
            home-manager.extraSpecialArgs = {
              inherit inputs;
              system = "x86_64-linux";
            };
          }
        ];
        specialArgs = { inherit inputs; machineType = "desktop"; };
      };
    };
  };
}
