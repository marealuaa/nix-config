{self, ...}: {
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
    # Fish itself
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set -g fish_greeting ""
        starship init fish | source
        zoxide init fish | source
      '';
      shellAliases = {
        ls = "eza -a --icons --group-directories-first";
        cat = "bat --style=plain";
      };
    };

    # Utilities
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    home.packages = with pkgs; [
      bat
      eza
      ripgrep
      jq
      fd
    ];
  };
}
