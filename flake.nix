{
  description = "f4ther's pen-test and workflow configuration";

  inputs = {
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  hyprland = {
    url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  nixgl = {
    url = "github:guibou/nixGL";
  };
};

  outputs = { self, nixpkgs, home-manager, nixgl, ... }:
    let
      system = "x86_64-linux";
      overlays = [ (import ./overlays/goose-overlay.nix) ];
      pkgs = import nixpkgs { inherit system overlays; };
    in {
      homeConfigurations.f4ther = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = { inherit system; nixgl = nixgl.packages.${system}; };

      };

      nixosConfigurations.f4ther = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos-config.nix
          { home-manager.users.f4ther = import ./home.nix; }
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
