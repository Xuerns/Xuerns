{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
	url = "github:noctalia-dev/noctalia";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, noctalia, ... }:
  let system = "x86_64-linux";
  in {
	nixosConfigurations.xuerns = nixpkgs.lib.nixosSystem {
		inherit system;
		specialArgs = {
		  inherit noctalia;
		};
		modules = [ 
		   ./configuration.nix 
		   home-manager.nixosModules.home-manager
		   
		   {
		      home-manager.useGlobalPkgs = true;
		      home-manager.useUserPackages = true;

		      home-manager.extraSpecialArgs = {
		         inherit noctalia;
		      };
		      
		      home-manager.users.xuerns = {
			 imports = [
			    noctalia.homeModules.default
			    ./home.nix
			 ];
		      };
		   }
		];
	};
  };
}
