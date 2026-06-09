{
  flake.homeModules.gui = {pkgs, ...}: let
    tokyoNightCyanHover = pkgs.writeText "Tokyo-Night-CyanHover.json" (builtins.toJSON {
      dark = {
        mPrimary = "#7aa2f7";
        mOnPrimary = "#1a1b26";
        mSecondary = "#bb9af7";
        mOnSecondary = "#1a1b26";
        mTertiary = "#7dcfff";
        mOnTertiary = "#1a1b26";
        mError = "#f7768e";
        mOnError = "#1a1b26";
        mSurface = "#1a1b26";
        mOnSurface = "#c0caf5";
        mSurfaceVariant = "#1f2335";
        mOnSurfaceVariant = "#a9b1d6";
        mOutline = "#3b4261";
        mShadow = "#15161e";
        mHover = "#7dcfff";
        mOnHover = "#1a1b26";
      };
    });
  in {
    home.file.".config/noctalia/palettes/Tokyo-Night-CyanHover.json".source = tokyoNightCyanHover;

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
          enabled = false;
          tint_intensity = 0.30000001192092896;
        };

        bar.default = {
          auto_hide = false;
          background_opacity = 0.85000002384185791;
          border = "outline";
          border_width = 0.0;
          capsule = false;
          capsule_fill = "outline";
          capsule_group = [];
          capsule_opacity = 1.0;
          capsule_padding = 6.0;
          center = ["audio_visualizer" "media"];
          contact_shadow = false;
          enabled = true;
          end = ["tray" "notifications" "clipboard" "bluetooth" "battery" "brightness" "volume" "network"];
          font_weight = 500;
          layer = "top";
          margin_edge = 10;
          margin_ends = 16;
          padding = 14;
          panel_overlap = 1;
          position = "left";
          radius = 22;
          radius_bottom_left = 22;
          radius_bottom_right = 22;
          radius_top_left = 22;
          radius_top_right = 22;
          reserve_space = true;
          scale = 1.3500000238418579;
          shadow = true;
          start = ["control-center" "clock" "workspaces"];
          thickness = 50;
          widget_spacing = 6;
        };

        battery = {
          warning_threshold = 20;
        };

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
          active_monitor_only = false;
          active_opacity = 1.0;
          active_scale = 1.0;
          auto_hide = false;
          background_opacity = 0.85000002384185791;
          cross_axis_padding = 8;
          enabled = false;
          icon_size = 48;
          inactive_opacity = 0.85000002384185791;
          inactive_scale = 0.85000002384185791;
          item_spacing = 6;
          launcher_icon = "grid-dots";
          launcher_position = "none";
          magnification = true;
          magnification_scale = 1.4500000476837158;
          main_axis_padding = 16;
          margin_edge = 8;
          margin_ends = 0;
          monitors = [];
          pinned = [];
          position = "bottom";
          radius = 16;
          radius_bottom_left = 16;
          radius_bottom_right = 16;
          radius_top_left = 16;
          radius_top_right = 16;
          reserve_space = false;
          shadow = true;
          show_dots = false;
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
          behavior = {
            lock = {
              action = "lock";
              command = "";
              enabled = false;
              resume_command = "";
              timeout = 600;
            };
            "lock-and-suspend" = {
              action = "lock_and_suspend";
              command = "";
              enabled = false;
              resume_command = "";
              timeout = 900;
            };
            "screen-off" = {
              action = "screen_off";
              command = "";
              enabled = false;
              resume_command = "";
              timeout = 660;
            };
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
          blur_intensity = 0.59999996423721313;
          blurred_desktop = false;
          monitors = [];
          tint_intensity = 0.0;
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
          background_opacity = 0.85000002384185791;
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
          background_opacity = 0.85000002384185791;
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

        shell = {
          app_icon_color = "primary";
          app_icon_colorize = true;
          avatar_path = "/home/mari/pictures/pfp.jpeg";
          clipboard_auto_paste = "auto";
          clipboard_confirm_clear_history = true;
          clipboard_enabled = true;
          clipboard_history_max_entries = 50;
          clipboard_image_action_command = "";
          corner_radius_scale = 2.0;
          date_format = "%A, %x";
          disable_mipmaps = false;
          font_family = "JetBrainsMono Nerd Font";
          launch_apps_as_systemd_services = false;
          middle_click_opens_widget_settings = true;
          niri_overview_type_to_launch_enabled = true;
          offline_mode = false;
          password_style = "random";
          polkit_agent = false;
          screen_time_enabled = false;
          settings_show_advanced = true;
          setup_wizard_enabled = true;
          shared_gl_context = true;
          show_location = true;
          telemetry_enabled = false;
          time_format = "{:%H:%M}";
          ui_scale = 1.0499999523162842;

          animation = {
            enabled = true;
            speed = 0.80000001192092896;
          };

          mpris = {
            blacklist = [];
          };

          panel = {
            borders = false;
            clipboard_placement = "attached";
            control_center_placement = "attached";
            launcher_categories = true;
            launcher_compact = false;
            launcher_placement = "attached";
            launcher_show_icons = true;
            open_near_click_clipboard = true;
            open_near_click_control_center = false;
            open_near_click_launcher = true;
            open_near_click_session = true;
            open_near_click_wallpaper = true;
            session_placement = "attached";
            shadow = true;
            transparency_mode = "solid";
            wallpaper_placement = "attached";
          };

          screen_corners = {
            enabled = true;
            size = 30;
          };

          screenshot = {
            copy_to_clipboard = true;
            directory = "";
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
            alpha = 0.25999999046325684;
            direction = "center";
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
          builtin = "Tokyo-Night";
          community_palette = "Oxocarbon";
          custom_palette = "Tokyo-Night-CyanHover";
          mode = "dark";
          source = "custom";
          wallpaper_scheme = "m3-content";
          templates = {
            builtin_ids = [];
            community_ids = [];
            enable_builtin_templates = true;
            enable_community_templates = true;
          };
        };

        wallpaper = {
          directory = "/home/mari/pictures/wallpapers";
          directory_dark = "";
          directory_light = "";
          edge_smoothness = 0.30000001192092896;
          enabled = true;
          fill_color = "primary";
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

        widget = {
          active_window = {
            icon_size = 14.0;
            max_length = 260.0;
            min_length = 80.0;
            title_scroll = "none";
            type = "active_window";
          };
          audio_visualizer = {
            bands = 20;
            show_when_idle = true;
            type = "audio_visualizer";
            width = 144.0;
          };
          battery = {
            anchor = true;
            show_label = false;
            type = "battery";
            warning_color = "primary";
          };
          brightness = {
            anchor = true;
            scale = 1.25;
            show_label = false;
            type = "brightness";
          };
          clock = {
            scale = 0.94999999999999996;
            type = "clock";
          };
          "control-center" = {
            anchor = true;
            color = "primary";
            custom_image = ./_NixOS.svg;
            custom_image_colorize = true;
            scale = 1.7;
            type = "control-center";
          };
          cpu = {
            stat = "cpu_usage";
            type = "sysmon";
          };
          date = {
            format = "{:%a %d %b}";
            type = "clock";
          };
          input_volume = {
            device = "input";
            type = "volume";
          };
          keyboard_layout = {
            cycle_command = "";
            hide_when_single_layout = false;
            type = "keyboard_layout";
          };
          launcher = {
            color = "primary";
            custom_image = "/home/mari/Downloads/NixOS.png";
            custom_image_colorize = true;
            scale = 1.7;
            type = "launcher";
          };
          lock_keys = {
            display = "short";
            hide_when_off = false;
            show_caps_lock = true;
            show_num_lock = true;
            show_scroll_lock = false;
            type = "lock_keys";
          };
          media = {
            art_size = 39.0;
            hide_when_no_media = true;
            max_length = 220.0;
            min_length = 80.0;
            title_scroll = "on_hover";
            type = "media";
          };
          network = {
            show_label = false;
            type = "network";
          };
          network_rx = {
            stat = "net_rx";
            type = "sysmon";
          };
          network_tx = {
            stat = "net_tx";
            type = "sysmon";
          };
          notifications = {
            hide_when_no_unread = true;
            type = "notifications";
          };
          output_volume = {
            device = "output";
            type = "volume";
          };
          ram = {
            stat = "ram_used";
            type = "sysmon";
          };
          session = {
            anchor = true;
            scale = 1.2;
            type = "session";
          };
          spacer = {
            type = "spacer";
          };
          temp = {
            stat = "cpu_temp";
            type = "sysmon";
          };
          tray = {
            detached_panel = false;
            drawer = true;
            type = "tray";
          };
          volume = {
            show_label = false;
            type = "volume";
          };
          weather = {
            max_length = 40;
            show_condition = false;
            type = "weather";
          };
          workspaces = {
            display = "none";
            empty_color = "#7DCFFF";
            occupied_color = "#7DCFFF";
            scale = 1.1500000000000001;
            type = "workspaces";
          };
        };
      };
    };
  };
}
