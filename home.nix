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
      go_1_27
      gopls
      air
      delve
      golangci-lint
      gcc

      # DevOps
      graphviz       

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
      slack   
   
      # Preview
      vlc

      # Image Editor
      gimp

      # Tools
      appimage-run
      libreoffice
   ];
}
