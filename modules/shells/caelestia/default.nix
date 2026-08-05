{ ... }:

{
   imports = [
      ./config.nix
   ];
	   
   xdg.configFile."hypr".source = ./config/hypr;
   xdg.configFile."caelestia".source = ./config/caelestia;
   xdg.configFile."fish".source = ./fish;
   xdg.configFile."foot".source = ./foot;
}
