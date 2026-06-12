{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.stylix = {pkgs, ...}: {
    imports = [inputs.stylix.nixosModules.stylix];

    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
    ];

    stylix = {
      enable = true;

      homeManagerIntegration.autoImport = true;
      homeManagerIntegration.followSystem = true;

      polarity = "dark";

      base16Scheme = {
        base00 = "151515";
        base01 = "242424";
        base02 = "333333";
        base03 = "424242";
        base04 = "B8B2B2";
        base05 = "E8E3E3";
        base06 = "F2EEEE";
        base07 = "FFFFFF";
        base08 = "B66467";
        base09 = "D9BC8C";
        base0A = "D9BC8C";
        base0B = "8C977D";
        base0C = "8AA6A2";
        base0D = "8DA3B9";
        base0E = "A988B0";
        base0F = "A67C52";
      };

      cursor = {
        package = pkgs.apple-cursor;
        name = "macOS";
        size = 16;
      };

      icons = {
        enable = true;
        package = pkgs.whitesur-icon-theme;
        dark = "WhiteSur-dark";
        light = "WhiteSur-light";
      };

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };

        sansSerif = {
          package = self.packages.${pkgs.stdenv.hostPlatform.system}.sf-pro;
          name = "SF Pro Display";
        };

        serif = {
          package = self.packages.${pkgs.stdenv.hostPlatform.system}.sf-pro;
          name = "SF Pro Display";
        };

        sizes = {
          applications = 12;
          terminal = 12;
          desktop = 12;
          popups = 12;
        };
      };
    };
  };

  flake.homeModules.stylix = {...}: {
    stylix.targets.zen-browser.profileNames = ["mari"];
  };
}
