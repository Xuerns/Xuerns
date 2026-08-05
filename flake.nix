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
  };

  outputs = { self, nixpkgs, home-manager, caelestia-shell, ...}:
  let system = "x86_64-linux";
  in {
	nixosConfigurations.xuerns = nixpkgs.lib.nixosSystem {
		inherit system;
		specialArgs = {
		  inherit caelestia-shell;
		};
		modules = [ 
		   ./configuration.nix 
		   home-manager.nixosModules.home-manager
		   
		   {
		      home-manager.useGlobalPkgs = true;
		      home-manager.useUserPackages = true;

		      home-manager.extraSpecialArgs = {
		         inherit caelestia-shell;
		      };
		      
		      home-manager.users.xuerns = {
			 imports = [
			    caelestia-shell.homeManagerModules.default
			    ./home.nix
			 ];
		      };
		   }
		];
	};
  };
}

