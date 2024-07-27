{
  description = "personal use flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ...}: {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    homeConfigurations = {
        "mrupnik" = home-manager.lib.homeManagerConfiguration {

            pkgs = import nixpkgs { system = "x86_64-linux"; };

            modules = [ ./home.nix ];
        };
    };

  };
}
