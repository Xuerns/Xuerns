# Home Package define configuration for user ecosystem
{ pkgs, ... }:

{
   imports = [
      ./modules/shells/noctalia
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
      
      # Python
      python3

      # Containers
      docker-compose

      # Javascript
      nodejs
      pnpm

      # Android
      kotlin

      # Editor
      vscodium
      antigravity-ide
      android-studio

      # Data
      dbeaver-bin

      # Agents CLI
      codex
      opencode

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
 
      # ChatApp
      discord

      # Preview
      vlc
   ];
}
