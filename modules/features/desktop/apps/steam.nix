{
  flake.nixosModules.gaming = {pkgs, ...}: {
    programs.gamemode.enable = true;

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];

      extraPackages = with pkgs; [
        hidapi
      ];
    };

    environment.systemPackages = with pkgs; [
      lutris
      wineWow64Packages.staging
      vulkan-tools
      winetricks
      heroic
      umu-launcher
      protonup-qt
    ];
  };
}
