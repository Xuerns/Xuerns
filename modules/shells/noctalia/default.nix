{ ... }:

{
   imports = [
	./config.nix
   ];
   
   xdg.configFile."hypr".source = ./config/hypr;
   xdg.configFile."fish".source = ./fish;
   xdg.configFile."foot".source = ./foot; 
}
