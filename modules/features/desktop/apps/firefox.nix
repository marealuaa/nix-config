{
  flake.homeModules.apps = {...}: {
    programs.firefox = {
      enable = true;

      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };
        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          };
        };
      };

      profiles.mari = {
        isDefault = true;
        id = 0;
        extensions.force = true;

        userContent = ''
          * {
          	--colorA1: #1a1b26;
          	--colorA3: #1a1b26;
          	--colorA5: #bb9af7;
          	--colorA6: #24283b;

          	/* scrollbar-width: thin !important; */
          	/* scrollbar-color: #24283b #16161e !important; */

          }

          @-moz-document url("about:privatebrowsing") {

          	html:not(#ublock0-epicker),
          	html:not(#ublock0-epicker) body,
          	#newtab-customize-overlay {
          		background-color: #16161e !important;
          		color: #a9b1d6;
          	}

          	#search-handoff-button {
          		background-color: #1a1b26 !important;
          		color: #a9b1d6;
          		border: none !important;
          		box-shadow: none !important;
          		border-bottom: 1px solid var(--colorA5) !important;
          		border-radius: 10px 10px 10px 10px !important;
          	}

          	.fake-caret {
          		background: rgb(255, 255, 255) !important;
          	}

          	.logo-and-wordmark .wordmark {
          		fill: var(--colorA5) !important;
          	}
          }

          @-moz-document url("about:home"),
          url("about:blank"),
          url("about:newtab") {

          	html:not(#ublock0-epicker),
          	html:not(#ublock0-epicker) body,
          	#newtab-customize-overlay {
          		background-color: #16161e !important;
          	}

          	.search-wrapper .search-handoff-button {
          		background-color: #16161e !important;
          		color: #a9b1d6 !important;
          		font-family: 'JetBrainsMono Nerd Font' !important;
          		border: 2px solid #24283b !important;
          		border-radius: 10px 10px 10px 10px !important;
          		box-shadow: 0px 0px 20px #1a1b26 !important;
          	}

          	.search-wrapper .logo-and-wordmark {
          		opacity: 0.8 !important;
          		display: none !important;
          	}

          	.search-wrapper input:focus {
          		color: white !important;
          	}

          	.search-wrapper .search-button {
          		fill: #ffffff5e !important;
          	}

          	.search-wrapper .search-button:focus,
          	.search-wrapper .search-button:hover {
          		background-color: transparent !important;
          		fill: white !important;
          	}

          	.outer-wrapper.newtab-experience .search-wrapper .search-handoff-button .fake-caret {
          		top: 12px !important;
          	}

          	.outer-wrapper.newtab-experience .search-wrapper .search-inner-wrapper {
          		min-height: 42px !important;
          	}

          	.top-site-outer .tile {
          		border-radius: 8px;
          		background-color: #1a1b26 !important;
          		/* box-shadow:	0px 0px 20px #1a1b26 !important; */
          		border: 2px solid #24283b !important;
          	}


          	.top-site-outer:hover .tile {
          		border-radius: 8px;
          		background-color: #1a1b26 !important;
          		box-shadow: 0px 0px 20px #1a1b26 !important;
          		border: 2px solid #24283b !important;
          	}

          	.top-site-outer .top-site-icon {
          		background-color: #1a1b26 !important;
          		background-position: center center;
          		background-repeat: no-repeat;
          		border-radius: 4px;
          		position: absolute;

          	}

          	.top-sites-list:not(.dnd-active) .top-site-outer:is(.active, :focus, :hover) {
          		background-color: #16161e !important;
          		border: 2px solid #24283b !important;
          		box-shadow: 0px 0px 20px #1a1b26 !important;
          	}

          	.top-site-outer .title {
          		font-family: 'JetBrainsMono Nerd Font' !important;
          		font-weight: 400 !important;
          		/* font-style: italic !important; */
          		/* letter-spacing: 0.1em !important; */
          	}

          	.icon.icon-pin-small {
          		display: none !important;
          	}
          }
        '';

        userChrome = ''
          * {
            --colorB1: #1a1b26;
            --colorB2: #24283b;
            --colorB3: #24283b;
            --colorB4: #444b6a;
          }

          /* ----- Remove tab bar spacer ----- */
          .titlebar-spacer {
            display: none !important;
          }

          /* ----- Avoids white flash ----- */
          #tabbrowser-tabpanels {
            background-color: var(--uc-light-bkgnd-color, var(--colorB1)) !important;
          }

          /* ----- bookmarks items centering ----- */
          #PlacesToolbarItems {
            display: flex !important;
            justify-content: center !important;
          }

          /* order of bars */
          #navigator-toolbox #nav-bar {
            -moz-box-ordinal-group: 0 !important;
            background-color: transparent !important;
          }

          #navigator-toolbox #toolbar-menubar {
            -moz-box-ordinal-group: 1 !important;
          }

          #titlebar {
            -moz-box-ordinal-group: 2 !important;
          }

          #PersonalToolbar {
            -moz-box-ordinal-group: 3 !important;
          }

          /* fullscreen nav errors */
          :root[tabsintitlebar][sizemode="maximized"] #navigator-toolbox {
            -moz-appearance: none !important;
            padding-top: 8px !important;
          }

          /* fullscreen padding */
          :root[tabsintitlebar][sizemode="maximized"] #titlebar {
            -moz-appearance: none !important;

          }

          /* PUSH DOWN */
          #navigator-toolbox {
            margin-top: 0px;
            padding-top: 5px !important;
            padding-bottom: 0px !important;
          }

          /* height fixes */

          /* tabs height */
          :root {
            --tab-min-height: 36px !important;
          }

          :root #tabbrowser-tabs {
            --tab-min-height: 36px !important;
          }

          /* menu bar height */
          #toolbar-menubar {
            margin-top: 0px !important;
            margin-bottom: 0px !important;
            padding-top: 0px !important;
            padding-bottom: 0px !important;
            line-height: 22px !important;
            max-height: 22px !important;
          }

          /* close/min/max fix */
          #toolbar-menubar .titlebar-button {
            padding-block: 0px !important;
          }

          /* non active tabs have darker text */
          .tabbrowser-tab:not([visuallyselected="true"]):not([multiselected]):not(:hover) {
            color: #565f89 !important;
          }

          /* icons */
          /* #PanelUI-menu-button {
            list-style-image: url(image/firefox.svg) !important;
          } */

          #back-button>.toolbarbutton-icon {
            border: none !important;
            width: calc(2 * var(--toolbarbutton-inner-padding) + 16px) !important;
            height: calc(2 * var(--toolbarbutton-inner-padding) + 16px) !important;
            padding: var(--toolbarbutton-inner-padding) !important;
            border-radius: var(--toolbarbutton-border-radius) !important;
          }

          #nav-bar #PanelUI-button .toolbarbutton-icon {
            opacity: 0.8 !important;
          }



          /* url bar */
          #urlbar-background {
            display: none !important;
          }

          #nav-bar:not([customizing="true"])>#nav-bar-customization-target>#urlbar-container:not(:hover)>#urlbar:not([focused])>#urlbar-input-container>#page-action-buttons {
            opacity: 0;
          }

          #page-action-buttons {
            transition: opacity 0.15s ease;
          }

          #nav-bar:not([customizing="true"])>#nav-bar-customization-target>#urlbar-container:not(:hover)>#urlbar:not([focused])>#urlbar-input-container>#identity-box {
            opacity: 0;
          }

          #nav-bar:not([customizing="true"])>#nav-bar-customization-target>#urlbar-container:not(:hover)>#urlbar:not([focused])>#urlbar-input-container>#tracking-protection-icon-container {
            opacity: 0;
          }

          #tracking-protection-icon-container {
            transition: opacity 0.15s ease;
          }

          /* url bar */
          #urlbar {
            --autocomplete-popup-highlight-background: transparent !important;
          }

          #urlbar-container {
            border-radius: 10px 10px 10px 10px !important;
          }

          #urlbar-input-container,
          #searchbar {
            border-radius: 10px 10px 10px 10px !important;
          }

          .urlbarView-body-inner {
            border-top: 0px !important;
          }

          #urlbar-input-container {
            padding-left: 7px;
            padding-right: 7px;
          }

          #navigator-toolbox {
            --lwt-toolbar-field-border-color: transparent !important;
            --lwt-toolbar-field-focus: transparent !important;
            --toolbar-field-focus-border-color: #77777773 !important;
          }

          #urlbar:not(.megabar):not([focused="true"]):-moz-lwtheme,
          #urlbar:not(.megabar):not([focused="true"]):-moz-lwtheme:hover {
            border-color: transparent;
          }

          #urlbar {
            border: 2px solid #24283b !important;
            border-radius: 6px !important;
            background-color: #16161e;
            font-family: 'JetBrainsMono Nerd Font';

          }

          #urlbar {
            box-shadow: 0px 0px 20px #1a1b26 !important;
          }

          #urlbar[breakout] {
            height: auto !important;
          }

          #tracking-protection-icon-container {
            border-inline-end: none !important;
            border-image: none !important;
          }

          /* megabar */
          #urlbar[breakout][breakout-extend][open] {
            background-color: #16161e !important;
            -webkit-backdrop-filter: blur(32px) !important;
            backdrop-filter: blur(32px) !important;
          }

          #urlbar[breakout][breakout-extend]>#urlbar-input-container,
          #urlbar-input-container {
            height: var(--urlbar-height) !important;
            padding-block: 0px !important;
            padding-inline: 0px !important;
            transition: none !important;
          }

          #urlbar[breakout][breakout-extend] {
            top: calc((var(--urlbar-toolbar-height) - var(--urlbar-height)) / 2) !important;
            left: 0 !important;
            width: 100% !important;
          }

          #urlbar .urlbar-input-box {
            text-align: center;
          }

          #wrapper-urlbar-container #urlbar {
            height: var(--urlbar-height) !important;
          }

          /* new tab icon 16 */
          #tabs-newtab-button .toolbarbutton-icon,
          #new-tab-button .toolbarbutton-icon {
            width: calc(2 * var(--toolbarbutton-inner-padding) + 12px) !important;
            height: calc(2 * var(--toolbarbutton-inner-padding) + 12px) !important;
          }

          /* plus/newtab button */
          toolbar #tabs-newtab-button:not([disabled="true"]):not([checked]):not([open]):not(:active):hover>.toolbarbutton-icon,
          toolbar #new-tab-button:not([disabled="true"]):not([checked]):not([open]):not(:active):hover>.toolbarbutton-icon {
            border: 0 !important;
            border-radius: 6px !important;
            background-image: none !important;
            background-color: #1a1b26 !important;
          }

          toolbar #tabs-newtab-button:not([disabled="true"]):-moz-any([open], [checked], :hover:active)>.toolbarbutton-icon,
          toolbar #new-tab-button:not([disabled="true"]):-moz-any([open], [checked], :hover:active)>.toolbarbutton-icon {
            border: 0 !important;
            border-radius: 6px !important;
            background-image: none !important;
            background-color: #24283b !important;
          }

          /* main bar */
          #navigator-toolbox {
            background-color: #16161e !important;
            --tabs-border-color: none !important;
            --my-tab-min-width: 100px !important;
            --tabs-navbar-shadow-size: 0px !important;
          }

          #tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])>#tabbrowser-arrowscrollbox>.tabbrowser-tab[first-visible-unpinned-tab] {
            margin-inline-start: 2px !important;
          }

          /* remove fill when loading on the tab which isnt formated for different border radius */
          #tabbrowser-tabs {
            --tab-loading-fill: transparent !important;
            margin-left: 10px !important;
          }

          /* width of the tabs. */
          .tabbrowser-tab[fadein]:not([pinned]) {
            max-width: 200px !important;
            min-width: var(--my-tab-min-width) !important;
          }

          .tabbrowser-tab:not([visuallyselected="true"]):not([multiselected]):not(:hover) .tab-icon-image {
            opacity: 0.8 !important;
          }

          /* fix the height of a tab because if you change --tab-min-height it doesnt work for fullcreen */
          #TabsToolbar {
            margin-top: 5px !important;
            margin-bottom: 5px !important;
          }

          /* remove line between the tabs / seperators */
          #tabbrowser-tabs .tabbrowser-tab::before,
          #tabbrowser-tabs .tabbrowser-tab::after {
            border: 0 !important;
          }

          /* select tabs */
          .tabbrowser-tab .tab-background[selected="true"] {
            border: 2px solid #24283b !important;
            border-radius: 6px !important;
            background-image: none !important;
            background-color: #16161e !important;
            box-shadow: 0px 0px 20px #1a1b26 !important;
          }

          .tabbrowser-tab .tab-background:not([selected]) {
            border: 0 !important;
            border-radius: 6px !important;
            background-image: none !important;
            background-color: #16161e !important;
          }

          /* tabs on hover */
          #tabbrowser-tabs .tabbrowser-tab:hover>.tab-stack>.tab-background:not([selected="true"]) {
            border: 0 !important;
            border-radius: 10px 10px 10px 10px !important;
            background-image: none !important;
            background-color: #1a1b26 !important;
          }

          /* multiselect tabs on hover */
          #tabbrowser-tabs .tabbrowser-tab .tab-background[multiselected="true"] {
            border: 0 !important;
            border-radius: 10px 10px 10px 10px !important;
            background-image: none !important;
            background-color: #24283b !important;
          }

          /* fixing multiselect */
          .tab-background[multiselected="true"]:not([selected="true"])>.tab-background-inner {
            background: none !important;
          }


          /* tab close button on hover */
          .tabbrowser-tab:not([pinned]) .tab-close-button {
            display: -moz-box !important;
            opacity: 0;
            visibility: collapse !important;
            transition: opacity 0.25s, visibility 0.25s ease-in !important;
          }

          .tabbrowser-tab:not([pinned]):hover .tab-close-button {
            opacity: 1;
            visibility: visible !important;
            border-radius: 20px 20px 20px 20px !important;
          }

          #titlebar #TabsToolbar #tabbrowser-tabs .tabbrowser-tab .tab-background {
            margin-block: 2px !important;
          }

          /* bookmark menu >:( */
          #PersonalToolbar {
            --uc-bm-height: 24px;
            --uc-bm-padding: 6px;
            padding: 1px 6px !important;
            position: absolute;
          }

          #PlacesToolbarItems>.bookmark-item {
            padding-block: var(--uc-bm-padding) !important;
            padding-left: 6px !important;
            padding-right: 6px !important;
          }

          /* to use blur enable layout.css.backdrop-filter.enabled */
          #PersonalToolbar {
            background-color: #16161e !important;
            -webkit-backdrop-filter: blur(32px) !important;
            backdrop-filter: blur(32px) !important;
          }


          :root:-moz-lwtheme-brighttext {
            --arrowpanel-background: #1a1b26 !important;
            --panel-separator-zap-gradient: linear-gradient(90deg, #7aa2f7 0%, #7aa2f7 39%, #16161e 100%) !important;
            --button-hover-bgcolor: #24283b !important;
            --button-active-bgcolor: #24283b !important;
            --button-bgcolor: #1a1b26 !important;
            --toolbarbutton-icon-fill-opacity: 0.8 !important;
          }


          :root:-moz-lwtheme-brighttext menupopup {
            --dark-menu-background-color: rgba(34, 34, 36, 0.98) !important;
          }

          /* move left close/min/max buttons */

          .titlebar-buttonbox-container {
            -moz-box-ordinal-group: 0 !important;
          }

          #nav-bar {
            padding-left: 105px;
          }

          #TabsToolbar .titlebar-buttonbox-container {
            visibility: visible !important;
            position: absolute !important;
            top: 5px;
            left: 0;
          }

          .titlebar-buttonbox-container {
            display: block;
          }

          #TabsToolbar .titlebar-buttonbox-container .titlebar-button {
            border-radius: 4px !important;
          }

          .titlebar-button>.toolbarbutton-icon {
            height: 13x !important;
            min-height: 13px !important;
            width: 13px !important;
            min-width: 13px !important;
          }

          .titlebar-button {
            padding-left: 8px !important;
            padding-right: 8px !important;
            margin-left: 4px !important;
          }

          :root[sizemode="maximized"] .titlebar-buttonbox-container {
            padding-top: 8px !important;
          }


          .titlebar-min {
            -moz-box-ordinal-group: 2 !important;
          }

          .titlebar-max,
          .titlebar-restore {
            -moz-box-ordinal-group: 1 !important;
          }

          .titlebar-close {
            -moz-box-ordinal-group: 0 !important;
          }

          /*  Move left close/min/max buttons - COMMENT THIS ALL OF THE WAY DOWN TO GET RID OF MACOS ICONS */
          #nav-bar {
            padding-left: 90px;
          }

          #TabsToolbar .titlebar-buttonbox-container,
          :root[inFullscreen="true"] #window-controls {
            -moz-box-ordinal-group: 0 !important;
            position: absolute !important;
            top: 12px;
            left: 0;
          }

          :root[inFullscreen="true"] #window-controls {
            display: -webkit-box;
          }

          .titlebar-buttonbox-container {
            display: block;
          }

          :root[sizemode="maximized"] .titlebar-buttonbox-container {
            padding-top: 8px !important;
          }

          :root:-moz-window-inactive:not([customizing]) :is(.titlebar-buttonbox, #window-controls)>toolbarbutton:not(:hover) {
            opacity: 0.65 !important;
            list-style-image: url(window/inactive.svg) !important;
          }

          :is(.titlebar-buttonbox, #window-controls) .toolbarbutton-icon {
            opacity: 1 !important;
            appearance: none !important;
          }

          .titlebar-button>.toolbarbutton-icon,
          #window-controls>toolbarbutton>.toolbarbutton-icon {
            width: 14px !important;
            min-width: 14px !important;
            min-height: 14px !important;
            height: 14px !important;
            stroke: none !important;
          }

          .titlebar-buttonbox,
          #window-controls {
            margin-right: 6x !important;
            margin-left: 0 !important;
          }

          .titlebar-close,
          #close-button {
            appearance: none !important;
            padding: 0px !important;
            padding-left: 8px !important;
            padding-right: 8px !important;
            margin: 0px !important;
            background-color: transparent !important;
            -moz-box-ordinal-group: 0 !important;
          }

          .titlebar-min,
          #minimize-button {
            appearance: none !important;
            padding: 0px !important;
            padding-left: 8px !important;
            padding-right: 8px !important;
            margin: 0px !important;
            background-color: transparent !important;
            -moz-box-ordinal-group: 1 !important;
          }

          .titlebar-max,
          .titlebar-restore,
          #restore-button {
            appearance: none !important;
            padding: 0px !important;
            padding-left: 8px !important;
            padding-right: 8px !important;
            margin: 0px !important;
            background-color: transparent !important;
            -moz-box-ordinal-group: 2 !important;
          }

          #TabsToolbar #window-controls>toolbarbutton,
          #TabsToolbar .titlebar-buttonbox .titlebar-button {
            list-style-image: url(window/inactive.svg) !important;
          }

          #TabsToolbar .titlebar-buttonbox-container:hover .titlebar-close,
          #TabsToolbar #window-controls:hover #close-button {
            list-style-image: url(window/close.svg) !important;

          }

          #TabsToolbar .titlebar-buttonbox-container .titlebar-close:hover,
          #TabsToolbar #window-controls #close-button:hover {
            list-style-image: url(window/close-hover.svg) !important;
          }


          #TabsToolbar .titlebar-buttonbox-container:hover .titlebar-min,
          #TabsToolbar #window-controls:hover #minimize-button {
            list-style-image: url(window/minimize.svg) !important;
          }

          #TabsToolbar .titlebar-buttonbox-container .titlebar-min:hover,
          #TabsToolbar #window-controls #minimize-button:hover {
            list-style-image: url(window/minimize-hover.svg) !important;
          }

          #TabsToolbar .titlebar-buttonbox-container:hover .titlebar-max,
          #TabsToolbar .titlebar-buttonbox-container:hover .titlebar-restore,
          #TabsToolbar #window-controls:hover #restore-button {
            list-style-image: url(window/maximize.svg) !important;
          }

          #TabsToolbar .titlebar-buttonbox-container .titlebar-max:hover {
            list-style-image: url(window/maximize-hover.svg) !important;
          }

          :root[sizemode="maximized"] #TabsToolbar .titlebar-buttonbox-container .titlebar-max:hover,
          #TabsToolbar .titlebar-buttonbox-container .titlebar-restore:hover,
          #TabsToolbar #window-controls #restore-button:hover {
            list-style-image: url(window/maximize-restore.svg) !important;
          }
        '';

        settings = {
          "browser.contentblocking.category" = "strict";
          "browser.download.start_downloads_in_tmp_dir" = true;
          "browser.uitour.enabled" = false;
          "privacy.globalprivacycontrol.enabled" = true;
          "privacy.antitracking.isolateContentScriptResources" = true;

          "security.OCSP.enabled" = 0;
          "security.csp.reporting.enabled" = false;
          "security.ssl.treat_unsafe_negotiation_as_broken" = true;
          "browser.xul.error_pages.expert_bad_cert" = true;
          "security.tls.enable_0rtt_data" = false;

          "browser.cache.disk.enable" = false;
          "browser.privatebrowsing.forceMediaMemoryCache" = true;
          "media.memory_cache_max_size" = 65536;
          "browser.sessionstore.interval" = 60000;

          "privacy.history.custom" = true;
          "browser.privatebrowsing.resetPBM.enabled" = true;
          "network.http.speculative-parallel-limit" = 0;
          "network.dns.disablePrefetch" = true;
          "network.dns.disablePrefetchFromHTTPS" = true;
          "browser.urlbar.speculativeConnect.enabled" = false;
          "browser.places.speculativeConnect.enabled" = false;
          "network.prefetch-next" = false;

          "browser.urlbar.trimHttps" = true;
          "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
          "browser.search.separatePrivateDefault.ui.enabled" = true;
          "browser.search.suggest.enabled" = false;
          "browser.urlbar.quicksuggest.enabled" = false;
          "browser.urlbar.groupLabels.enabled" = false;
          "browser.formfill.enable" = false;
          "network.IDN_show_punycode" = true;
          "browser.urlbar.trending.featureGate" = false;

          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_error_page_user_suggestions" = true;
          "signon.formlessCapture.enabled" = false;
          "signon.privateBrowsingCapture.enabled" = false;
          "network.auth.subresource-http-auth-allow" = 1;
          "editor.truncate_user_pastes" = false;
          "network.http.referer.XOriginTrimmingPolicy" = 2;

          "privacy.userContext.ui.enabled" = true;
          "pdfjs.enableScripting" = false;
          "browser.safebrowsing.downloads.remote.enabled" = false;
          "permissions.default.desktop-notification" = 2;
          "permissions.default.geo" = 2;
          "geo.provider.network.url" = "https://beacondb.net/v1/geolocate";
          "browser.search.update" = false;
          "permissions.manager.defaultsUrl" = "";
          "extensions.getAddons.cache.enabled" = false;
          "extensions.enabledScopes" = 5;

          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = "data:,";
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.coverage.opt-out" = true;
          "toolkit.coverage.endpoint.base" = "";
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "datareporting.usage.uploadEnabled" = false;
          "app.shield.optoutstudies.enabled" = false;
          "app.normandy.enabled" = false;
          "app.normandy.api_url" = "";
          "breakpad.reportURL" = "";
          "browser.tabs.crashReporting.sendReport" = false;

          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "browser.discovery.enabled" = false;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
          "browser.preferences.moreFromMozilla" = false;
          "browser.aboutConfig.showWarning" = false;
          "browser.startup.homepage_override.mstone" = "ignore";
          "browser.aboutwelcome.enabled" = false;
          "browser.profiles.enabled" = true;

          "browser.ai.control.default" = "blocked";
          "browser.ml.enable" = false;
          "browser.ml.chat.enabled" = false;
          "browser.ml.chat.menu" = false;
          "browser.tabs.groups.smart.enabled" = false;
          "browser.ml.linkPreview.enabled" = false;

          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.compactmode.show" = true;
          "browser.privateWindowSeparation.enabled" = false;
          "full-screen-api.transition-duration.enter" = "0 0";
          "full-screen-api.transition-duration.leave" = "0 0";
          "full-screen-api.warning.timeout" = 0;

          "browser.newtabpage.activity-stream.default.sites" = "";
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;

          "browser.download.manager.addToRecentDocs" = false;
          "browser.download.open_pdf_attachments_inline" = true;
          "browser.bookmarks.openInTabClosesMenu" = false;
          "browser.menu.showViewImageInfo" = true;
          "findbar.highlightAll" = true;
          "layout.word_select.eat_space_to_next_word" = false;
        };
      };
    };
  };
}
