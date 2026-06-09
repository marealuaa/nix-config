{
  flake.homeModules.gui = {...}: {
    programs.noctalia-shell = {
      settings = {
        settingsVersion = 59;

        bar = {
          barType = "simple";
          position = "left";
          density = "spacious";
          showOutline = false;
          showCapsule = true;
          capsuleOpacity = 0.1;
          capsuleColorKey = "primary";
          widgetSpacing = 3;
          contentPadding = 3;
          fontScale = 1.1;
          enableExclusionZoneInset = true;
          backgroundOpacity = 0.85;
          useSeparateOpacity = false;
          marginVertical = 4;
          marginHorizontal = 4;
          frameThickness = 8;
          frameRadius = 12;
          outerCorners = true;
          hideOnOverview = false;
          displayMode = "always_visible";
          autoHideDelay = 500;
          autoShowDelay = 150;
          showOnWorkspaceSwitch = true;

          widgets = {
            left = [
              {
                id = "ControlCenter";
                colorizeDistroLogo = false;
                colorizeSystemIcon = "primary";
                colorizeSystemText = "none";
                enableColorization = true;
                icon = "noctalia";
                useDistroLogo = true;
              }
              {
                id = "Clock";
                clockColor = "primary";
                customFont = "";
                formatHorizontal = "HH:mm ddd, MMM dd";
                formatVertical = "HH mm";
                tooltipFormat = "HH:mm ddd, MMM dd";
                useCustomFont = false;
              }
              {
                id = "SystemMonitor";
                compactMode = true;
                diskPath = "/";
                iconColor = "primary";
                showCpuCores = false;
                showCpuFreq = false;
                showCpuTemp = false;
                showCpuUsage = true;
                showDiskAvailable = false;
                showDiskUsage = false;
                showDiskUsageAsPercent = false;
                showGpuTemp = false;
                showLoadAverage = false;
                showMemoryAsPercent = false;
                showMemoryUsage = true;
                showNetworkStats = true;
                showSwapUsage = false;
                textColor = "none";
                useMonospaceFont = true;
                usePadding = false;
              }
              {
                id = "MediaMini";
                compactMode = true;
                hideMode = "visible";
                hideWhenIdle = false;
                maxWidth = 145;
                panelShowAlbumArt = true;
                scrollingMode = "always";
                showAlbumArt = true;
                showArtistFirst = true;
                showProgressRing = true;
                showVisualizer = false;
                textColor = "primary";
                useFixedWidth = true;
                visualizerType = "linear";
              }
            ];

            center = [
              {
                id = "Workspace";
                characterCount = 2;
                colorizeIcons = false;
                emptyColor = "secondary";
                enableScrollWheel = true;
                focusedColor = "primary";
                followFocusedScreen = false;
                fontWeight = "regular";
                groupedBorderOpacity = 1;
                hideUnoccupied = false;
                iconScale = 0.8;
                labelMode = "none";
                occupiedColor = "secondary";
                pillSize = 0.7;
                showApplications = false;
                showApplicationsHover = false;
                showBadge = false;
                showLabelsOnlyWhenOccupied = true;
                unfocusedIconsOpacity = 1;
              }
              {
                id = "AudioVisualizer";
                colorName = "primary";
                hideWhenIdle = false;
                width = 200;
              }
            ];

            right = [
              {
                id = "Tray";
                blacklist = [];
                chevronColor = "primary";
                colorizeIcons = true;
                drawerEnabled = true;
                hidePassive = false;
                pinned = [];
              }
              {
                id = "NotificationHistory";
                hideWhenZero = true;
                hideWhenZeroUnread = true;
                iconColor = "primary";
                showUnreadBadge = true;
                unreadBadgeColor = "secondary";
              }
              {
                id = "Battery";
                deviceNativePath = "__default__";
                displayMode = "graphic-clean";
                hideIfIdle = false;
                hideIfNotDetected = false;
                showNoctaliaPerformance = true;
                showPowerProfiles = true;
              }
              {
                id = "Volume";
                displayMode = "alwaysHide";
                iconColor = "primary";
                middleClickCommand = "pwvucontrol || pavucontrol";
                textColor = "primary";
              }
              {
                id = "Brightness";
                applyToAllMonitors = false;
                displayMode = "alwaysHide";
                iconColor = "primary";
                textColor = "primary";
              }
            ];
          };

          mouseWheelAction = "none";
          reverseScroll = false;
          mouseWheelWrap = true;
          middleClickAction = "none";
          middleClickFollowMouse = false;
          middleClickCommand = "";
          rightClickAction = "controlCenter";
          rightClickFollowMouse = true;
          rightClickCommand = "";
          screenOverrides = [];
        };

        general = {
          avatarImage = "/home/mari/pictures/pfp.jpeg";
          dimmerOpacity = 0;
          showScreenCorners = true;
          forceBlackScreenCorners = true;
          scaleRatio = 1;
          radiusRatio = 1;
          iRadiusRatio = 2;
          boxRadiusRatio = 1;
          screenRadiusRatio = 1;
          animationSpeed = 2;
          animationDisabled = false;
          compactLockScreen = false;
          lockScreenAnimations = true;
          lockOnSuspend = true;
          showSessionButtonsOnLockScreen = true;
          showHibernateOnLockScreen = false;
          enableLockScreenMediaControls = true;
          enableShadows = true;
          enableBlurBehind = true;
          shadowDirection = "center";
          shadowOffsetX = 0;
          shadowOffsetY = 0;
          language = "";
          allowPanelsOnScreenWithoutBar = true;
          showChangelogOnStartup = true;
          telemetryEnabled = false;
          enableLockScreenCountdown = true;
          lockScreenCountdownDuration = 10000;
          autoStartAuth = false;
          allowPasswordWithFprintd = false;
          clockStyle = "custom";
          clockFormat = "hh\nmm";
          passwordChars = true;
          lockScreenMonitors = [];
          lockScreenBlur = 0.8;
          lockScreenTint = 0;
          keybinds = {
            keyUp = ["Up"];
            keyDown = ["Down"];
            keyLeft = ["Left"];
            keyRight = ["Right"];
            keyEnter = ["Return" "Enter"];
            keyEscape = ["Esc"];
            keyRemove = ["Del"];
          };
          reverseScroll = false;
          smoothScrollEnabled = true;
        };

        ui = {
          fontDefault = "JetBrainsMono Nerd Font";
          fontFixed = "JetBrainsMono Nerd Font";
          fontDefaultScale = 1.1;
          fontFixedScale = 1.1;
          tooltipsEnabled = true;
          scrollbarAlwaysVisible = false;
          boxBorderEnabled = false;
          panelBackgroundOpacity = 0.85;
          translucentWidgets = false;
          panelsAttachedToBar = true;
          settingsPanelMode = "attached";
          settingsPanelSideBarCardStyle = false;
        };

        location = {
          weatherEnabled = true;
          weatherShowEffects = true;
          weatherTaliaMascotAlways = false;
          useFahrenheit = false;
          use12hourFormat = false;
          showWeekNumberInCalendar = false;
          showCalendarEvents = true;
          showCalendarWeather = true;
          analogClockInCalendar = false;
          firstDayOfWeek = -1;
          hideWeatherTimezone = false;
          hideWeatherCityName = false;
          autoLocate = true;
        };

        calendar = {
          cards = [
            {
              enabled = true;
              id = "calendar-header-card";
            }
            {
              enabled = true;
              id = "calendar-month-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
          ];
        };

        wallpaper = {
          enabled = true;
          overviewEnabled = true;
          directory = "/home/mari/pictures/wallpapers";
          monitorDirectories = [];
          enableMultiMonitorDirectories = false;
          showHiddenFiles = false;
          viewMode = "single";
          setWallpaperOnAllMonitors = true;
          linkLightAndDarkWallpapers = true;
          fillMode = "crop";
          useSolidColor = false;
          automationEnabled = false;
          wallpaperChangeMode = "random";
          randomIntervalSec = 300;
          transitionDuration = 1500;
          transitionType = ["fade" "disc" "stripes" "wipe" "pixelate" "honeycomb"];
          skipStartupTransition = false;
          transitionEdgeSmoothness = 0.05;
          panelPosition = "follow_bar";
          hideWallpaperFilenames = false;
          useOriginalImages = true;
          overviewBlur = 1;
          overviewTint = 0;
          useWallhaven = false;
          wallhavenQuery = "";
          wallhavenSorting = "relevance";
          wallhavenOrder = "desc";
          wallhavenCategories = "111";
          wallhavenPurity = "100";
          wallhavenRatios = "";
          wallhavenApiKey = "";
          wallhavenResolutionMode = "atleast";
          wallhavenResolutionWidth = "";
          wallhavenResolutionHeight = "";
          sortOrder = "date_asc";
          favorites = [];
        };

        appLauncher = {
          enableClipboardHistory = true;
          autoPasteClipboard = false;
          enableClipPreview = true;
          clipboardWrapText = true;
          enableClipboardSmartIcons = true;
          enableClipboardChips = true;
          clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
          clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
          position = "bottom_center";
          pinnedApps = ["firefox" "steam"];
          sortByMostUsed = true;
          terminalCommand = "alacritty -e";
          customLaunchPrefixEnabled = false;
          customLaunchPrefix = "";
          viewMode = "list";
          showCategories = true;
          iconMode = "tabler";
          showIconBackground = false;
          enableSettingsSearch = true;
          enableWindowsSearch = true;
          enableSessionSearch = true;
          ignoreMouseInput = false;
          screenshotAnnotationTool = "";
          overviewLayer = false;
          density = "comfortable";
        };

        controlCenter = {
          position = "close_to_bar_button";
          diskPath = "/";
          shortcuts = {
            left = [
              {id = "Network";}
              {id = "Bluetooth";}
              {id = "WallpaperSelector";}
              {id = "NoctaliaPerformance";}
            ];
            right = [
              {id = "Notifications";}
              {id = "PowerProfile";}
              {id = "KeepAwake";}
              {id = "NightLight";}
            ];
          };
          cards = [
            {
              enabled = true;
              id = "profile-card";
            }
            {
              enabled = true;
              id = "shortcuts-card";
            }
            {
              enabled = true;
              id = "audio-card";
            }
            {
              enabled = false;
              id = "brightness-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
            {
              enabled = true;
              id = "media-sysmon-card";
            }
          ];
        };

        noctaliaPerformance = {
          disableWallpaper = true;
          disableDesktopWidgets = true;
        };

        dock = {
          enabled = false;
          position = "bottom";
          displayMode = "auto_hide";
          dockType = "attached";
          backgroundOpacity = 0.85;
          floatingRatio = 1;
          size = 1;
          onlySameOutput = true;
          monitors = [];
          pinnedApps = [];
          colorizeIcons = false;
          showLauncherIcon = false;
          launcherPosition = "end";
          launcherUseDistroLogo = false;
          launcherIcon = "";
          launcherIconColor = "none";
          pinnedStatic = false;
          inactiveIndicators = false;
          groupApps = false;
          groupContextMenuMode = "extended";
          groupClickAction = "cycle";
          groupIndicatorStyle = "dots";
          deadOpacity = 0.6;
          animationSpeed = 1;
          sitOnFrame = false;
          showDockIndicator = true;
          indicatorThickness = 3;
          indicatorColor = "primary";
          indicatorOpacity = 0.6;
        };

        network = {
          bluetoothRssiPollingEnabled = false;
          bluetoothRssiPollIntervalMs = 60000;
          networkPanelView = "wifi";
          wifiDetailsViewMode = "grid";
          bluetoothDetailsViewMode = "grid";
          bluetoothHideUnnamedDevices = false;
          disableDiscoverability = false;
          bluetoothAutoConnect = false;
        };

        sessionMenu = {
          enableCountdown = true;
          countdownDuration = 5000;
          position = "center";
          showHeader = true;
          showKeybinds = true;
          largeButtonsStyle = true;
          largeButtonsLayout = "single-row";
          powerOptions = [
            {
              action = "lock";
              command = "";
              countdownEnabled = true;
              enabled = true;
              keybind = "1";
            }
            {
              action = "suspend";
              command = "";
              countdownEnabled = true;
              enabled = true;
              keybind = "2";
            }
            {
              action = "hibernate";
              command = "";
              countdownEnabled = true;
              enabled = true;
              keybind = "3";
            }
            {
              action = "reboot";
              command = "";
              countdownEnabled = true;
              enabled = true;
              keybind = "4";
            }
            {
              action = "logout";
              command = "";
              countdownEnabled = true;
              enabled = true;
              keybind = "5";
            }
            {
              action = "shutdown";
              command = "";
              countdownEnabled = true;
              enabled = true;
              keybind = "6";
            }
            {
              action = "rebootToUefi";
              command = "";
              countdownEnabled = true;
              enabled = true;
              keybind = "7";
            }
            {
              action = "userspaceReboot";
              command = "";
              countdownEnabled = true;
              enabled = false;
              keybind = "";
            }
          ];
        };

        notifications = {
          enabled = true;
          enableMarkdown = false;
          density = "default";
          monitors = [];
          location = "top_right";
          overlayLayer = true;
          backgroundOpacity = 0.85;
          respectExpireTimeout = false;
          lowUrgencyDuration = 3;
          normalUrgencyDuration = 8;
          criticalUrgencyDuration = 15;
          clearDismissed = true;
          saveToHistory = {
            low = true;
            normal = true;
            critical = true;
          };
          sounds = {
            enabled = false;
            volume = 0.5;
            separateSounds = false;
            criticalSoundFile = "";
            normalSoundFile = "";
            lowSoundFile = "";
            excludedApps = "discord,firefox,chrome,chromium,edge";
          };
          enableMediaToast = false;
          enableKeyboardLayoutToast = true;
          enableBatteryToast = true;
        };

        osd = {
          enabled = true;
          location = "top_right";
          autoHideMs = 2000;
          overlayLayer = true;
          backgroundOpacity = 0.85;
          enabledTypes = [0 1 2];
          monitors = [];
        };

        audio = {
          volumeStep = 5;
          volumeOverdrive = false;
          spectrumFrameRate = 30;
          visualizerType = "mirrored";
          spectrumMirrored = true;
          mprisBlacklist = [];
          preferredPlayer = "";
          volumeFeedback = false;
          volumeFeedbackSoundFile = "";
        };

        brightness = {
          brightnessStep = 5;
          enforceMinimum = true;
          enableDdcSupport = false;
          backlightDeviceMappings = [];
        };

        colorSchemes = {
          useWallpaperColors = false;
          predefinedScheme = "TokyoNight-Custom";
          darkMode = true;
          schedulingMode = "off";
          generationMethod = "tonal-spot";
          monitorForColors = "";
          syncGsettings = true;
        };

        templates = {
          activeTemplates = [];
          enableUserTheming = false;
        };

        nightLight = {
          enabled = false;
          forced = false;
          autoSchedule = false;
          nightTemp = "6000";
          dayTemp = "6500";
          manualSunrise = "06:30";
          manualSunset = "18:30";
        };

        hooks = {
          enabled = false;
          wallpaperChange = "";
          darkModeChange = "";
          screenLock = "";
          screenUnlock = "";
          performanceModeEnabled = "";
          performanceModeDisabled = "";
          startup = "";
          session = "";
          colorGeneration = "";
        };

        plugins = {
          autoUpdate = false;
          notifyUpdates = true;
        };

        idle = {
          enabled = true;
          screenOffTimeout = 600;
          lockTimeout = 660;
          suspendTimeout = 1800;
          fadeDuration = 5;
          screenOffCommand = "";
          lockCommand = "";
          suspendCommand = "";
          resumeScreenOffCommand = "";
          resumeLockCommand = "";
          resumeSuspendCommand = "";
          customCommands = "[]";
        };

        desktopWidgets = {
          enabled = false;
          overviewEnabled = true;
          gridSnap = true;
          gridSnapScale = false;
          monitorWidgets = [
            {
              name = "eDP-1";
              widgets = [];
            }
          ];
        };
      };

      # Plugin declaration
      plugins = {
        sources = [
          {
            enabled = true;
            name = "Official Noctalia Plugins";
            url = "https://github.com/noctalia-dev/noctalia-plugins";
          }
        ];
        states = {
          color-scheme-creator = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
          };
        };
        version = 2;
      };
    };

    home.file.".config/noctalia/colorschemes/TokyoNight-Custom/TokyoNight-Custom.json".text = builtins.toJSON {
      dark = {
        mSurface = "#1a1b2e";
        mSurfaceVariant = "#16213e";
        mOnSurface = "#c0caf5";
        mOnSurfaceVariant = "#565f89";
        mOutline = "#3b4261";
        mPrimary = "#7aa2f7"; # blue
        mOnPrimary = "#1a1b2e";
        mSecondary = "#bb9af7"; # purple
        mOnSecondary = "#1a1b2e";
        mTertiary = "#9d7cd8";
        mOnTertiary = "#1a1b2e";
        mHover = "#bb9af7"; # purple
        mOnHover = "#1a1b2e";
        mError = "#f7768e";
        mOnError = "#1a1b2e";
        mShadow = "#000000";
      };
      light = {
        mSurface = "#d5d6db";
        mSurfaceVariant = "#c4c5cc";
        mOnSurface = "#343b58";
        mOnSurfaceVariant = "#565f89";
        mOutline = "#9699a3";
        mPrimary = "#2e7de9"; # blue
        mOnPrimary = "#ffffff";
        mSecondary = "#7847bd"; # purple
        mOnSecondary = "#ffffff";
        mTertiary = "#7847bd";
        mOnTertiary = "#ffffff";
        mHover = "#7847bd"; # purple
        mOnHover = "#ffffff";
        mError = "#f52a65";
        mOnError = "#ffffff";
        mShadow = "#000000";
      };
    };
  };
}
