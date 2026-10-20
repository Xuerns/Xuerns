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

   home.sessionPath = [
        "$HOME/go/bin"
        "$HOME/.local/bin"
   ];
  
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
      minikube
      awscli2       
      google-cloud-sdk
        
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
      antigravity
      android-studio

      # Agents CLI
      codex
      opencode
      antigravity-cli

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
      libreoffice
   ];
}
