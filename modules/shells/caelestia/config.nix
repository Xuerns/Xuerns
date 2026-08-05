{ ... }:

{
   programs.caelestia = {
	enable = true;
        cli.enable = true;
        settings = {
	   paths.wallpaperDir = "/etc/nixos/assets/wallpapers";
	};
   };
}
