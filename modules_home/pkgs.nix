{ pkgs, ... }:
{
    nixpkgs.config.allowUnfree = true;
    # security.polkit.enable = true;
    home.packages = with pkgs; [
        source-code-pro
        source-han-sans
        source-han-serif

        # 终端
        zsh
        fastfetch
        foot
        htop
        ranger
        micro
        killall
        nginx
        unzip
        zip
        _7zz
        smem
        wev
        wget
        xprop

        chromium
        firefox
        vscode
        rofi
        grim
        slurp
        swappy
        #sunshine

        ffmpeg
        ffmpegthumbnailer
        mpv

        gcc              # 安装 GNU 编译器集合
        gnumake          # 通常编译还需要 make
        binutils         # 包含 ld、as 等基础工具
        pkg-config       # 用于管理编译标志
        gnumake
        go

        bind             # nslookup:DNS查询
        hyprpolkitagent  # 密码认证弹窗
        iw               # 无线网卡
        pciutils

        libva-utils
        intel-vaapi-driver
    ];
}
