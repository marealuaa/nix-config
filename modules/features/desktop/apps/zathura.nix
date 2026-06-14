{
  flake.homeModules.apps = {
    programs.zathura = {
      enable = true;

      options = {
        adjust-open = "best-fit";
        pages-per-row = 1;
        scroll-page-aware = true;
        zoom-min = 10;
        selection-clipboard = "clipboard";
        guioptions = "none";
        statusbar-h-padding = 8;
        statusbar-v-padding = 4;
        font = "monospace 10";
      };

      mappings = {
        "K" = "zoom in";
        "J" = "zoom out";
        "f" = "toggle_fullscreen";
        "R" = "reload";
        "<C-r>" = "rotate rotate-ccw";
        "r" = "rotate";

        "gg" = "goto top";
        "G" = "goto bottom";
      };
    };
  };
}
