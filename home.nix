# Home Package define configuration for user ecosystem
{ pkgs, ... }:

{
   imports = [
      # ./modules/shells/caelestia
      ./modules/shells/noctalia
      ./modules/services/ollama
   ];

   home.username = "xuerns";
   home.homeDirectory = "/home/xuerns";

   home.stateVersion = "26.05";

   programs.home-manager.enable = true; 

   home.sessionVariables = {
	XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
   };
  
   home.packages = with pkgs; [
      # Github
      git
      gh
      
      # Golang
      go
      gopls
      air
      delve
      golangci-lint
      gcc

      # Containers
      docker-compose

      # Javascript
      nodejs
      pnpm

      # Editor
      vscodium
      antigravity-ide
      neovim
      
      # Agents CLI
      claude-code      

      # shell
      fish
      foot
      starship
      eza
      zoxide
      fzf
      bat
      fd
      ripgrep
      fast
      cava     
 
      # Discord
      discord
   ];
}
