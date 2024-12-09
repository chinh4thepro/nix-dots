{
  pkgs,
  inputs,
  spicetify-nix,
  config,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  programs.spicetify = {
    enable = true;
    theme =
      spicePkgs.themes.text
      // {
        additionalCss = ''
          :root {
            --font-family: 'fantasque sans m nerdfont', monospace;

            --display-coverart-image: block;
            --display-tracklist-image: block

            --border-radius: 0px;
            --border-width: 2px;
          }

          .main-cardImage-image, .main-cardImage-imageWrapper, #fad-art-image, #fad-art:hover, #fad-art-overlay, #fsd-art-image,.main-entityHeader-image, .main-coverSlotCollapsed-navAltContainer,.main-trackList-rowSectionEnd>:not(:last-child), [dir=ltr] .main-trackList-rowSectionVariable>:not(:last-child,.main-trackList-facepile), [dir=ltr] .main-trackList-rowSectionStart>:not(:last-child),.main-nowPlayingView-coverArt, .x-entityImage-xsmall,.fRZRXRIV2YBCFLYgwDAr,.HD9s7U5E1RLSWKpXmrqx,.main-editImageButton-rounded,.x-entityImage,.osuFIR_6Jo9yKsmLL4y2,.Vn9yz8P5MjIvDT8c0U6w,.k270skPbT7JOaSidSA2a,.aaasJtK_0Z_ggHet0u6v,.kwzBRpFigKr1EP2d5qle,.H3mjE6AEBDPRuHNKUpRK ,.GS_6HA9xIobh5dt5VUSY,.GenericModal,.jW4eWdr_LUeOXwPpKhWG, .kh6wYYPvgRPBhA2wj3AS .qp7Sys7hJSZHLzw4K_yF,.ffFwfKcPDbmAPLXzxzKq,.main-nowPlayingView-section,.main-nowPlayingView-aboutArtistV2Image,.huMHH_FySIW5UhSrJfy8>video,.main-topBar-background,.main-nowPlayingView-aboutArtistButton,.RmbxUFLb4j9KmgftJyk1,.main-trackList-rowImage,.main-editImageButton-image, .lkXpBMSmNP9w702sek8V, /*-Canvas-*/.yMQTWVwLJ5bV8VGiaqU3:not(.MxmW8QkHqHWtuhO589PV)/**/,.main-yourLibraryX-entryPoints,.Root__main-view { border-radius: 0px !important; }

          .x-filterBox-expandButton, .main-avatar-avatar, .main-topBar-buddyFeed, .main-topBar-button, .Button-sc-1dqy6lx-0, .main-coverSlotCollapsed-expandButton, .NqzueDshzvgXEygqOGPG, .main-embedWidgetGenerator-themeRadio, .Psc33HXPyazZYAAr1tgz {border-radius: 0px !important;} .XNFZdOLgMlx491fEWdYJ, .ChipClear__ChipClearComponent-sc-zv5btm-0, .Button-sc-1dqy6lx-0, .Button-sc-y0gtbx-0, .main-nowPlayingView-aboutArtistV2FollowButton, .main-playPauseButton-button, .ButtonInner-sc-14ud5tc-0, .search-searchCategory-carouselButton, .ChipInnerComponent-sm, .ChipInnerComponent-sm-selected, .switch, .arrow-btn, .pSxFsY9Fgcj5f8Gf05mh, .qyKJPLjz8o4jnbk92JOn, .reset, .rdp-button, .btn, .TabItem__StyledTabItem-sc-2ani5y-0, .main-playlistEditDetailsModal-closeBtn, .main-embedWidgetGenerator-closeBtn, .Chip__ChipComponent-sc-ry3uox-0 {border-radius: 0px !important;} .view-homeShortcutsGrid-playButton, .ButtonInner-medium-iconOnly,  .button-module__button___hf2qg_marketplace {border-radius: 0px !important;} .ButtonInner-large-iconOnly {border-radius: 0px !important;} .main-globalNav-searchInputContainer, .SFAoASy0S_LZJmYZ3Fh9, .x-searchInput-searchInputInput,  .toggle-module__toggle-indicator-wrapper___6Lcp0_marketplace, .x-toggle-indicatorWrapper, .main-topBar-searchBar {border-collapse: separate; border-radius: 0px !important;}

          button:has(path[d='M6.53 9.47a.75.75 0 0 1 0 1.06l-2.72 2.72h1.018a.75.75 0 0 1 0 1.5H1.25v-3.579a.75.75 0 0 1 1.5 0v1.018l2.72-2.72a.75.75 0 0 1 1.06 0zm2.94-2.94a.75.75 0 0 1 0-1.06l2.72-2.72h-1.018a.75.75 0 1 1 0-1.5h3.578v3.579a.75.75 0 0 1-1.5 0V3.81l-2.72 2.72a.75.75 0 0 1-1.06 0z']) {display: none;}

          button:has(path[d='M16 2.45c0-.8-.65-1.45-1.45-1.45H1.45C.65 1 0 1.65 0 2.45v11.1C0 14.35.65 15 1.45 15h5.557v-1.5H1.5v-11h13V7H16V2.45z']) {display: none;}
        '';
      };
    enabledCustomApps = with spicePkgs.apps; [
      marketplace
      newReleases
      lyricsPlus
    ];
    enabledExtensions = with spicePkgs.extensions; [
      lastfm
      volumePercentage
      adblock
      history
      songStats
      playlistIntersection
      shuffle
      powerBar
      fullAlbumDate
      goToSong
      showQueueDuration
      hidePodcasts
      savePlaylists
      copyToClipboard
      betterGenres
    ];
    # enabledSnippets = with spicePkgs.snippets; [];
    colorScheme = "custom";
    customColorScheme = with config.lib.stylix.colors; {
      accent = "${base0D}";
      accent-active = "${base0D}";
      accent-inactive = "${base05}";
      banner = "${base05}";
      border-active = "${base0D}";
      border-inactive = "${base03}";
      header = "${base04}";
      highlight = "${base02}";
      main = "${base00}";
      notification = "${base02}";
      notification-error = "${base08}";
      subtext = "${base05}";
      text = "${base05}";
    };
  };
  imports = [
    spicetify-nix.homeManagerModules.default
  ];
}
