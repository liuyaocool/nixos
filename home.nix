{ config, pkgs, common, ... }:

{
  home.stateVersion = common.stateVersion;
  nixpkgs.config.allowUnfree = true;

  home.sessionPath = [
    "$HOME/bin"
  ];

  home.sessionVariables = {
    RUSTUP_DIST_SERVER = "https://mirrors.tuna.tsinghua.edu.cn/rustup";
    RUSTUP_UPDATE_ROOT = "https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  home.packages = with pkgs; [
    bind # nslookup
    chromium
    fastfetch
    ffmpeg
    firefox
    gnumake
    go
    killall
    micro
    mpv
    ranger
    rofi
    rustup
    source-code-pro
    unzip
    vim
    vscode
    waybar
    wev
    wget
    xprop
    zsh
  ];

  fonts.fontconfig.enable = true;

  home.file.".local/share/fonts" = {
    source = ./fonts;
    recursive = true;
  };

  home.file.".config" = {
    source = ./config;
    recursive = true;
  };
 
  programs.git = {
    enable = true;
    settings.user = {
      name  = "ly-nix";
      email = "ly-nix@gmail.com";
    };
  };

  programs.foot = {
    enable = true;
    # theme = "aeroroot";
    settings = { # man foot.ini 5
      main = {
        font = "Source Code Pro:size=10";
      };
      colors-dark = {
        alpha = 0.7;
        background = "000000";
        foreground = "d1ba74";
        # folder
        regular4 = "008457";
        # zsh-autosuggestions
        bright0 = "8C979F";
      };
      mouse = {
      	hide-when-typing = false;
      };
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos";
      ra = "ranger";
    };
  };
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos";
      ra = "ranger";
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