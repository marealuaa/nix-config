{
  flake.homeModules.shell = { pkgs, ... }: {
    programs.starship = {
      enable = true;
      enableFishIntegration = true; 

      settings = {
        add_newline = true;

        format = """
$directory$git_branch$git_state$git_status$nix_shell$rust$package$cmd_duration
$character
""";

        character = {
          success_symbol = "[❯](bold blue) ";
          error_symbol = "[❯](bold red) ";
          vimcmd_symbol = "[❮](bold magenta) ";
        };

        directory = {
          style = "bold blue";
          truncation_length = 3;
          truncate_to_repo = true; 
        };

        git_branch = {
          format = "on [$branch]($style) ";
          style = "bold magenta"; 
        };

        git_status = {
          format = "([$all_status$ahead_behind]($style) )";
          style = "bold magenta";
        };

        cmd_duration = {
          format = "took [$duration]($style) ";
          style = "bold magenta";
          min_time = 2000; 
        };

        package = {
          disabled = false;
          format = "via [$symbol]($style)";
        };

        nix_shell = {
          symbol = "❄️ ";
          format = "via [$symbol]($style)";
          style = "bold blue";
        };

        rust = {
          symbol = "🦀 ";
          format = "via [$symbol]($style)";
          style = "bold red";
        };

        username.disabled = true;
        hostname.disabled = true;
      };
    };
  };
}

