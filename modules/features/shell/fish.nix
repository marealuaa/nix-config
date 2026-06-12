{inputs, ...}: {
  flake.nixosModules.shell = {pkgs, ...}: {
    programs.fish.enable = true;
    environment.systemPackages = with pkgs; [
      tree
      wget
      curl
      pciutils
      usbutils
      btrfs-progs
      ouch # unzip, 7z, tar all-in-one replacement
    ];
  };

  flake.homeModules.shell = {pkgs, ...}: {
    imports = [
      inputs.nix-index-database.homeModules.default
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    home.packages = with pkgs; [
      bat
      eza
      ripgrep
      jq
      fd
    ];

    programs = {
      fish = {
        enable = true;
        interactiveShellInit = ''
          set -g fish_greeting ""
        '';
        shellAliases = {
          ls = "eza -a --icons --group-directories-first";
          cat = "bat --style=plain";
        };
      };

      direnv = {
        enable = true;
        enableFishIntegration = true;
        nix-direnv.enable = true;
      };

      zoxide = {
        enable = true;
        enableFishIntegration = true;
      };

      fzf = {
        enable = true;
        enableFishIntegration = true;
      };

      nix-index = {
        enable = true;
        enableFishIntegration = true;
      };

      nix-index-database.comma.enable = true;

      nix-your-shell = {
        enable = true;
        enableFishIntegration = true;
      };
    };
  };
}
