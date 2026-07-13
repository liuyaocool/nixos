{ config, pkgs, common, ... }:

{
  home.stateVersion = common.stateVersion;
  nixpkgs.config.allowUnfree = true;

  home.sessionPath = [
    "$HOME/nbin"
    "$HOME/bin"
  ];

  fonts.fontconfig.enable = true;

  home.file.".local/share/fonts" = { source = ./fonts;  recursive = true; };
  home.file.".config"            = { source = ./config; recursive = true; };
  home.file."nbin"               = { source = ./bin;    recursive = true; };

  home.sessionVariables = {
    RUSTUP_DIST_SERVER = "https://mirrors.tuna.tsinghua.edu.cn/rustup";
    RUSTUP_UPDATE_ROOT = "https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  # security.polkit.enable = true;
  home.packages = with pkgs; [
    source-code-pro
    source-han-sans
    source-han-serif
    
    awww
    bind # nslookup
    chromium
    fastfetch
    ffmpeg
    firefox
    foot
    gnumake
    go
    hyprland
    hyprpolkitagent
    iw
    killall
    micro
    mpv
    pciutils
    ranger
    rofi
    rustup
    smem
    unzip
    vim
    vscode
    wev
    wget
    xprop
    zsh
  ];

  systemd.user.services.waybar = {
    Unit = {
      Description = "Waybar";
      After = [
        "graphical-session.target"
      ];
    };
    Service = {
      ExecStart = "${pkgs.waybar}/bin/waybar";
      Restart = "on-failure";
      RestartSec = 2;
    };
    Install = {
      WantedBy = [
        "graphical-session.target"
      ];
    };
  };
  
  programs.git = {
    enable = true;
    settings.user = {
      name  = "ly-nix";
      email = "ly-nix@gmail.com";
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake path:$HOME/nixos";
      ra = "ranger";
      mem-usage = "smem -tk";
      pkg-search = "nix search nixpkgs ";
      gd = "git diff";
      gs = "git status";
      gu = "git pull";
    };
  };
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake path:$HOME/nixos";
      ra = "ranger";
      mem-usage = "smem -tk";
      pkg-search = "nix search nixpkgs ";
      gd = "git diff";
      gs = "git status";
      gu = "git pull";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };
    initContent = ''
      zstyle ':omz:update' mode disabled
    '';
  };

}