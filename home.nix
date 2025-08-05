{ pkgs, nixgl, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.username = "f4ther";
  home.homeDirectory = "/home/f4ther";
  home.stateVersion = "23.11";

  # Home Manager itself
  programs.home-manager.enable = true;

  # fish shell with everforest colored prompt
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g theme_everforest_background "hard"
      set -g themeeverforest_palette "medium"
      # Custom minimal everforest prompt
      function fish_prompt
        set_color -o "#a7c080"
        echo -n (whoami)"@"(hostname)" "
        set_color -o "#7fbbb3"
        echo -n (prompt_pwd)""
        set_color -o "#dbbc7f"
        echo -n "> "
        set_color normal
      end
      source /usr/share/cachyos-fish-config/cachyos-config.fish
 zoxide init fish | source
      direnv fish | source
      # potentially disabling fastfetch
      function fish_greeting
      end
      pyenv init - | source
      pyenv virtualenv-init - | source
      if test -e ~/.nix-profile/etc/profile.d/nix.fish
        source ~/.nix-profile/etc/profile.d/nix.fish
      end
    '';
    shellInit = ''
      if test -e ~/.nix-profile/etc/profile.d/nix.fish
        source ~/.nix-profile/etc/profile.d/nix.fish
      end
    '';
    shellAliases = {
      vim = "nvim";
      c = "z";
      gs = "git status";
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd c" ];
  };

  # Editor: point to .config/nvim for neovim config
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # Everforest theme for terminal (kitty), neovim, rofi

  # VSCode
 programs.vscode = {
    enable = true;
  };

  # Tool launcher: rofi with Alt+D binding, everforest theme via user config sync
  programs.rofi = {
    enable = true;
    extraConfig = {
      modi = "drun run";
      show-icons = true;
    };
    theme = null; # for user-level theming via ~/.config/rofi
  };

  # Clipboard manager
  services.clipman.enable = true;

  # Hack/CTF tools
  home.packages = with pkgs; [
    nmap
    rustscan
    gobuster
    wget
    git
    curl
    tmux
    zip
    unzip
    ruby
    wireshark
    ghidra
    rofi
    xh
    wireguard-tools
    rustc
    cargo
    vscode
    # goose
    xclip # for clipboard fallback
    devenv
  ];

}
