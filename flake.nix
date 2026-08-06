{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
	url = "github:caelestia-dots/shell";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
	url = "github:noctalia-dev/noctalia";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let system = "x86_64-linux";
  in {
	nixosConfigurations.xuerns = nixpkgs.lib.nixosSystem {
		inherit system;
		specialArgs = {
		  inherit inputs;
		};
		modules = [ 
		   ./configuration.nix 
		   home-manager.nixosModules.home-manager
		   
		   {
		      home-manager.useGlobalPkgs = true;
		      home-manager.useUserPackages = true;

		      home-manager.extraSpecialArgs = {
		         inherit inputs;
		      };
		      
		      home-manager.users.xuerns = {
			 imports = [
			    inputs.caelestia-shell.homeManagerModules.default
			    inputs.noctalia.homeModules.default
			    ./home.nix
			 ];
		      };
		   }
		];
	};
  };
}

