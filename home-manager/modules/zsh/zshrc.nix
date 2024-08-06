{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.lists) optionals;
  inherit (lib.attrsets) optionalAttrs;
  inherit (pkgs.stdenv) isLinux isDarwin;
in {
  programs.zsh = {
    initExtra = ''
      # Let jobs continue even if shell exits
      setopt NO_HUP

      # https://zsh.sourceforge.io/Doc/Release/Expansion.html
      setopt NO_CASE_GLOB
      setopt NUMERIC_GLOB_SORT
      setopt EXTENDED_GLOB

      # Prevents globbing for # as building .#flake causes issues without quotes
      disable -p '#'

      # Turn on command substitution in the prompt (and parameter expansion and arithmetic expansion).
      setopt promptsubst

      # Ignore duplicate in history.
      setopt hist_ignore_dups

      # Prevent record in history entry if preceding them with at least one space
      setopt hist_ignore_space

      # Nobody need flow control anymore. Troublesome feature.
      setopt noflowcontrol

      # For autocompletion of command line switches for aliases
      setopt COMPLETE_ALIASES

      # setup any-nix-shell integration
      ${pkgs.any-nix-shell}/bin/any-nix-shell zsh --info-right | source /dev/stdin

      # ZSH helper functions that are needed to load the config
      trysource() {
        # Sources file if it exists
        [[ -f $1 ]] && source $1
      }

      trypath() {
        # Adds to $PATH if exists
        [[ -e $1 ]] && path+=($1)
      }

      # HM is bad at this. Handle it
      trysource ''${HOME}/.nix-profile/etc/profile.d/hm-session-vars.sh
      trysource /etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh

      # Configure completion style
      # zstyle ":completion:*:commands" rehash 1
      zstyle ':completion:*:sudo:*' environ PATH="$SUDO_PATH:$PATH"

      # If running as root and nice >0, renice to 0.
      if [ "$USER" = 'root' ] && [ "$(cut -d ' ' -f 19 /proc/$$/stat)" -gt 0 ]; then
        renice -n 0 -p "$$" && echo "# Adjusted nice level for current shell to 0."
      fi
    '';

    envExtra = ''
      # Previously in .zshenv
      export PAGER=less
      export HOMEBREW_BREWFILE="~/.config/worldedit/$(hostname)"
      export AUTO_NOTIFY_THRESHOLD=30
      export ZPLUG_LOADFILE=$HOME/.zpackages.zsh
      typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

      export PATH="$PATH:$HOME/.local/bin"

      # Do the initialization when the script is sourced (i.e. Initialize instantly)
      ZVM_INIT_MODE=sourcing

      # ZSH Tmux plugin settings
      TMUX_MOTD=false
      if [[ $(hostname) == "A1708-MACOS" ]] || [[ $(hostname) == "A1708" ]] ; then
          TMUX_AUTOSTART=false
      fi
    '';
  };
}

