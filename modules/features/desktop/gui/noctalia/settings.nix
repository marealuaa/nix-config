{
  flake.homeModules.gui = {pkgs, ...}: let
    Paradise = pkgs.writeText "Paradise.json" (
      builtins.toJSON
      {
        dark = {
          mPrimary = "#8DA3B9";
          mOnPrimary = "#151515";
          mSecondary = "#A988B0";
          mOnSecondary = "#151515";
          mTertiary = "#B66467";
          mOnTertiary = "#151515";
          mError = "#B66467";
          mOnError = "#151515";
          mSurface = "#151515";
          mOnSurface = "#E8E3E3";
          mSurfaceVariant = "#242424";
          mOnSurfaceVariant = "#B8B2B2";
          mOutline = "#333333";
          mShadow = "#151515";
          mHover = "#333333";
          mOnHover = "#E8E3E3";
          terminal = {
            background = "#151515";
            foreground = "#E8E3E3";
            cursor = "#E8E3E3";
            cursorText = "#151515";
            selectionBg = "#333333";
            selectionFg = "#E8E3E3";
            normal = {
              black = "#151515";
              red = "#B66467";
              green = "#8C977D";
              yellow = "#D9BC8C";
              blue = "#8DA3B9";
              magenta = "#A988B0";
              cyan = "#8AA6A2";
              white = "#E8E3E3";
            };
            bright = {
              black = "#424242";
              red = "#B66467";
              green = "#8C977D";
              yellow = "#D9BC8C";
              blue = "#8DA3B9";
              magenta = "#A988B0";
              cyan = "#8AA6A2";
              white = "#FFFFFF";
            };
          };
        };
      }
    );
  in {
    home.file.".config/noctalia/palettes/Paradise.json".source = Paradise;

    programs.noctalia = {
      settings = {
        audio = {
          enable_overdrive = false;
          enable_sounds = false;
          notification_sound = "";
          sound_volume = 0.5;
          volume_change_sound = "";
        };

        backdrop = {
          blur_intensity = 0.5;
          enabled = true;
          tint_intensity = 0.0;
        };

        bar = {
          order = ["rain"];

          rain = {
            auto_hide = false;
            background_opacity = 0.8;
            border = "on_hover";
            border_width = 0.0;
            capsule = false;
            capsule_fill = "surface_variant";
            capsule_opacity = 1.0;
            capsule_padding = 6.0;
            center = ["media"];
            contact_shadow = false;
            enabled = true;
            end = ["network" "battery" "weather" "date" "clock" "tray" "notifications"];
            font_weight = 500;
            layer = "top";
            margin_edge = 0;
            margin_ends = 0;
            padding = 10;
            panel_overlap = 1;
            position = "top";
            radius = 0;
            radius_bottom_left = 0;
            radius_bottom_right = 0;
            radius_top_left = 0;
            radius_top_right = 0;
            reserve_space = true;
            scale = 1.1;
            shadow = true;
            start = ["group:g2" "workspaces"];
            thickness = 24;
            widget_spacing = 12;

            capsule_group = [
              {
                fill = "surface_variant";
                id = "g2";
                members = ["control-center" "launcher"];
                opacity = 0.0;
                padding = 0.0;
              }
            ];
          };
        };

        battery.warning_threshold = 20;

        brightness = {
          enable_ddcutil = false;
          ignore_mmids = [];
        };

        calendar = {
          enabled = false;
          refresh_minutes = 15;
        };

        control_center = {
          sidebar = "compact";
          sidebar_section = "compact";
          shortcuts = [
            {type = "wifi";}
            {type = "bluetooth";}
            {type = "caffeine";}
            {type = "nightlight";}
            {type = "notification";}
            {type = "power_profile";}
          ];
        };

        desktop_widgets = {
          enabled = true;
          schema_version = 2;
          grid = {
            cell_size = 16;
            major_interval = 4;
            visible = true;
          };
        };

        dock = {
          active_monitor_only = true;
          active_opacity = 1.0;
          active_scale = 1.0;
          auto_hide = true;
          background_opacity = 0.8;
          cross_axis_padding = 8;
          enabled = true;
          icon_size = 50;
          inactive_opacity = 0.85;
          inactive_scale = 0.85;
          item_spacing = 0;
          launcher_icon = "grid-dots";
          launcher_position = "none";
          magnification = true;
          magnification_scale = 1.45;
          main_axis_padding = 10;
          margin_edge = 8;
          margin_ends = 0;
          monitors = [];
          pinned = ["org.gnome.Nautilus" "spotify" "zen-beta" "vesktop"];
          position = "bottom";
          radius = 20;
          radius_bottom_left = 20;
          radius_bottom_right = 20;
          radius_top_left = 20;
          radius_top_right = 20;
          reserve_space = false;
          shadow = true;
          show_dots = true;
          show_instance_count = true;
          show_running = true;
        };

        hooks = {
          battery_charging = [];
          battery_discharging = [];
          battery_percentage_changed = [];
          battery_plugged = [];
          bluetooth_disabled = [];
          bluetooth_enabled = [];
          colors_changed = [];
          logging_out = [];
          power_profile_changed = [];
          rebooting = [];
          session_locked = [];
          session_unlocked = [];
          shutting_down = [];
          started = [];
          theme_mode_changed = [];
          wallpaper_changed = [];
          wifi_disabled = [];
          wifi_enabled = [];
        };

        idle = {
          behavior_order = ["lock" "screen-off" "lock-and-suspend"];
          pre_action_fade_seconds = 2.0;

          behavior.lock = {
            action = "lock";
            command = "";
            enabled = false;
            resume_command = "";
            timeout = 600;
          };
          behavior."lock-and-suspend" = {
            action = "lock_and_suspend";
            command = "";
            enabled = false;
            resume_command = "";
            timeout = 900;
          };
          behavior."screen-off" = {
            action = "screen_off";
            command = "";
            enabled = false;
            resume_command = "";
            timeout = 660;
          };
        };

        keybinds = {
          cancel = ["Escape"];
          down = ["Down"];
          left = ["Left"];
          right = ["Right"];
          up = ["Up"];
          validate = ["Return" "KP_Enter"];
        };

        location = {
          address = "";
          auto_locate = true;
          sunrise = "";
          sunset = "";
        };

        lockscreen = {
          blur_intensity = 0.2;
          blurred_desktop = false;
          enabled = true;
          monitors = [];
          tint_intensity = 0.1;
          wallpaper = "";
        };

        nightlight = {
          enabled = false;
          force = false;
          temperature_day = 6500;
          temperature_night = 4000;
        };

        notification = {
          allowed_urgencies = [];
          background_opacity = 0.85;
          blacklist = [];
          blacklist_allow_critical = true;
          collapse_on_dismiss = true;
          enable_daemon = true;
          layer = "top";
          monitors = [];
          offset_x = 20;
          offset_y = 8;
          position = "top_right";
          scale = 1.0;
          show_actions = true;
          show_app_name = true;
        };

        osd = {
          background_opacity = 0.85;
          monitors = [];
          offset_x = 20;
          offset_y = 8;
          orientation = "horizontal";
          position = "top_center";
          scale = 1.0;
          kinds = {
            bluetooth = true;
            brightness = true;
            caffeine = true;
            dnd = true;
            keyboard_layout = true;
            lock_keys = true;
            power_profile = true;
            volume = true;
            volume_input = true;
            volume_output = true;
            wifi = true;
          };
        };

        plugins = {
          enabled = [];
          source = [
            {
              auto_update = false;
              enabled = true;
              kind = "git";
              location = "https://github.com/noctalia-dev/official-plugins";
              name = "official";
            }
            {
              auto_update = false;
              enabled = true;
              kind = "git";
              location = "https://github.com/noctalia-dev/community-plugins";
              name = "community";
            }
          ];
        };

        shell = {
          app_icon_colorize = false;
          avatar_path = "/home/mari/Pictures/Misc/pfp.png";
          clipboard_auto_paste = "auto";
          clipboard_confirm_clear_history = true;
          clipboard_enabled = true;
          clipboard_history_max_entries = 100;
          clipboard_image_action_command = "";
          corner_radius_scale = 2.0;
          date_format = "%A, %x";
          disable_mipmaps = false;
          font_family = "SF Pro Display";
          launch_apps_as_systemd_services = false;
          middle_click_opens_widget_settings = true;
          niri_overview_type_to_launch_enabled = true;
          offline_mode = false;
          password_style = "default";
          polkit_agent = false;
          screen_time_enabled = false;
          settings_show_advanced = true;
          setup_wizard_enabled = true;
          shared_gl_context = true;
          show_location = true;
          telemetry_enabled = false;
          time_format = "{:%H:%M}";
          ui_scale = 1.0;

          animation = {
            enabled = true;
            speed = 0.85;
          };

          mpris.blacklist = [];

          panel = {
            borders = true;
            clipboard_placement = "centered";
            control_center_placement = "attached";
            launcher_categories = false;
            launcher_compact = true;
            launcher_placement = "attached";
            launcher_session_search = false;
            launcher_show_icons = true;
            open_near_click_clipboard = false;
            open_near_click_control_center = true;
            open_near_click_launcher = true;
            open_near_click_session = true;
            open_near_click_wallpaper = true;
            session_placement = "attached";
            shadow = true;
            transparency_mode = "solid";
            wallpaper_placement = "attached";
          };

          screen_corners = {
            enabled = false;
            size = 1;
          };

          screenshot = {
            copy_to_clipboard = true;
            directory = "/home/mari/Pictures/Screenshots";
            filename_pattern = "";
            freeze_screen = true;
            pipe_command = "";
            pipe_to_command = false;
            save_to_file = true;
          };

          session.actions = [
            {
              action = "lock";
              command = "";
              enabled = true;
              glyph = "";
              label = "";
              shortcut = "1";
              variant = "default";
            }
            {
              action = "logout";
              command = "";
              enabled = true;
              glyph = "";
              label = "";
              shortcut = "2";
              variant = "default";
            }
            {
              action = "lock_and_suspend";
              command = "";
              enabled = true;
              glyph = "";
              label = "";
              shortcut = "3";
              variant = "default";
            }
            {
              action = "reboot";
              command = "";
              enabled = true;
              glyph = "";
              label = "";
              shortcut = "4";
              variant = "default";
            }
            {
              action = "shutdown";
              command = "";
              enabled = true;
              glyph = "";
              label = "";
              shortcut = "5";
              variant = "destructive";
            }
          ];

          shadow = {
            alpha = 0.6;
            direction = "down";
          };
        };

        "system.monitor" = {
          cpu_poll_seconds = 2.0;
          cpu_temp_activity_threshold = 60.0;
          cpu_temp_critical_threshold = 85.0;
          cpu_usage_activity_threshold = 50.0;
          cpu_usage_critical_threshold = 90.0;
          disk_pct_activity_threshold = 80.0;
          disk_pct_critical_threshold = 95.0;
          disk_poll_seconds = 10.0;
          enabled = true;
          gpu_poll_seconds = 0.0;
          gpu_temp_activity_threshold = 60.0;
          gpu_temp_critical_threshold = 85.0;
          gpu_usage_activity_threshold = 50.0;
          gpu_usage_critical_threshold = 95.0;
          gpu_vram_activity_threshold = 50.0;
          gpu_vram_critical_threshold = 90.0;
          memory_poll_seconds = 2.0;
          net_rx_activity_threshold = 1.0;
          net_rx_critical_threshold = 50.0;
          net_tx_activity_threshold = 1.0;
          net_tx_critical_threshold = 50.0;
          network_poll_seconds = 3.0;
          ram_pct_activity_threshold = 60.0;
          ram_pct_critical_threshold = 90.0;
          swap_pct_activity_threshold = 20.0;
          swap_pct_critical_threshold = 80.0;
        };

        theme = {
          builtin = "Noctalia";
          community_palette = "Oxocarbon";
          custom_palette = "Paradise";
          mode = "dark";
          source = "custom";
          wallpaper_scheme = "m3-tonal-spot";
          templates = {
            builtin_ids = [];
            community_ids = [];
            enable_builtin_templates = true;
            enable_community_templates = true;
          };
        };

        wallpaper = {
          directory = "/home/mari/Pictures/Wallpapers";
          directory_dark = "";
          directory_light = "";
          edge_smoothness = 0.3;
          enabled = true;
          fill_color = "";
          fill_mode = "crop";
          per_monitor_directories = false;
          transition = ["fade" "wipe" "disc" "stripes" "zoom" "honeycomb"];
          transition_duration = 1500.0;
          transition_on_startup = false;
          automation = {
            enabled = false;
            interval_seconds = 1800;
            order = "random";
            recursive = true;
          };
        };

        weather = {
          effects = true;
          enabled = true;
          refresh_minutes = 30;
          unit = "metric";
        };

        # Widget definitions
        "widget.active_window" = {
          icon_size = 14.0;
          max_length = 260.0;
          min_length = 80.0;
          title_scroll = "none";
          type = "active_window";
        };
        "widget.audio_visualizer" = {
          bands = 15;
          type = "audio_visualizer";
          width = 75.0;
        };
        "widget.battery" = {
          display_mode = "graphic";
          scale = 0.75;
          show_label = false;
          type = "battery";
        };
        "widget.bongocat" = {
          script = "scripts/bongocat.lua";
          type = "scripted";
        };
        "widget.control-center" = {
          custom_image = "/home/mari/nix-config/modules/features/desktop/gui/noctalia/_NixOS.svg";
          custom_image_colorize = true;
          glyph = "brand-apple-filled";
          scale = 1.25;
          type = "control-center";
        };
        "widget.cpu" = {
          stat = "cpu_usage";
          type = "sysmon";
        };
        "widget.date" = {
          format = "{:%a}";
          type = "clock";
        };
        "widget.input_volume" = {
          device = "input";
          type = "volume";
        };
        "widget.keyboard_layout" = {
          cycle_command = "";
          hide_when_single_layout = false;
          type = "keyboard_layout";
        };
        "widget.lock_keys" = {
          display = "short";
          hide_when_off = false;
          show_caps_lock = true;
          show_num_lock = true;
          show_scroll_lock = false;
          type = "lock_keys";
        };
        "widget.media" = {
          art_size = 14.0;
          max_length = 220.0;
          min_length = 80.0;
          title_scroll = "always";
          type = "media";
        };
        "widget.network" = {
          scale = 1.15;
          show_label = false;
          type = "network";
        };
        "widget.network_rx" = {
          stat = "net_rx";
          type = "sysmon";
        };
        "widget.network_tx" = {
          stat = "net_tx";
          type = "sysmon";
        };
        "widget.output_volume" = {
          device = "output";
          type = "volume";
        };
        "widget.ram" = {
          stat = "ram_used";
          type = "sysmon";
        };
        "widget.spacer" = {type = "spacer";};
        "widget.temp" = {
          stat = "cpu_temp";
          type = "sysmon";
        };
        "widget.weather" = {
          scale = 0.95;
          show_condition = false;
          type = "weather";
        };
        "widget.workspaces" = {
          empty_color = "on_surface";
          focused_color = "on_surface";
          labels_only_when_occupied = true;
          minimal = true;
          occupied_color = "on_surface";
          pill_scale = 0.4;
          scale = 1.25;
          type = "workspaces";
        };
      };
    };
  };
}
