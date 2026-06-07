{ inputs, ... }: {
  flake.nixosModules.stylix = { pkgs, ... }: {
    imports = [ inputs.stylix.nixosModules.stylix ];

    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
    ];
    
    stylix = {
      enable = true;
      polarity = "dark";

      base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

      cursor = {
	package = pkgs.bibata-cursors;
	name = "Bibata-Modern-Classic";
	size = 22;
      };

      fonts = {
	monospace = {
	  package = pkgs.nerd-fonts.jetbrains-mono;
	  name = "JetBrainsMono Nerd Font";
	};

	sansSerif = {
	  package = pkgs.nerd-fonts.jetbrains-mono;
	  name = "JetBrainsMono Nerd Font Propo";
	};

	serif = {
	  package = pkgs.nerd-fonts.jetbrains-mono;
	  name = "JetBrainsMono Nerd Font Propo";
	};

	sizes = {
	  applications = 16;
	  terminal = 16;
	  desktop = 16;
	  popups = 16;
	};

      };
    };
  };
}
