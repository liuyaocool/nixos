{ config, pkgs, lib, common, ... }:

{
  imports = [
    ./hardware-configuration/macmini.nix
  ];

  system.stateVersion = common.stateVersion;
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # 允许非自由软件
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  
  # 允许不安全的包
  # nixpkgs.config.allowInsecurePredicate = pkg: builtins.elem (lib.getName pkg) [
  #   "broadcom-sta"
  # ];
  nixpkgs.config.permittedInsecurePackages = [
    "broadcom-sta-6.30.223.271-59-6.18.38"
  ];
  hardware.enableAllFirmware = true;
  boot.extraModulePackages = with config.boot.kernelPackages; [
    broadcom_sta
  ];
  boot.kernelModules = [
    "wl"
  ];
  boot.blacklistedKernelModules = [
    "b43"
    "bcma"
    "ssb"
  ];


  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  nix.settings.substituters = [
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://cache.nixos.org/"
  ];

  users.users."liuyao" = {
    isNormalUser = true;
    description = "liuyao";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHTCQa5ztJIg85TWfwux5DZ2DxCDjn1/XaOCVbMWHWtC w10885"
    ];
  };

  networking.hosts = {
    "192.168.8.29" = ["fs.com" "w.com" "ws.com"];
  };

  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [ 
        fcitx5-rime
        fcitx5-gtk
        qt6Packages.fcitx5-configtool
       ];
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      gtk3
      glib
      libGL
      libX11
      cairo
      pango

#      gobject-introspection
#      atk
#      gdk-pixbuf
#      harfbuzz
#      libXext
#      libXrender
#      libXrandr
#      libXi
#      libXcursor
#      libxcb
#      libxkbcommon
#      zlib
#      openssl
    ];
  };
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  virtualisation.podman.enable = true;

  security.sudo.extraRules = [
    {
      users = ["liuyao"];
      commands = [
        {
          command = "/run/current-system/sw/bin/nixos-rebuild *";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/ls *";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/reboot";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

}
