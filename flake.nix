{
  description = "personal use flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ...}: {

    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

    homeConfigurations = {
        "default" = home-manager.lib.homeManagerConfiguration {

            pkgs = import nixpkgs { system = "x86_64-linux"; };

            modules = [ ./home.nix ];
        };
    };

  };
}
