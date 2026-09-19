{ ... }:

{
   programs.noctalia = {
      enable = true;
   };

   programs.noctalia.settings = {
      theme.templates.user.fastfetch = {
        input_path = "${./config/fastfetch.jsonc}";
        output_path = "$XDG_CONFIG_HOME/fastfetch/config.jsonc";
    };
  };
}
