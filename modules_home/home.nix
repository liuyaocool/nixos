let params = import ../params.nix; in
{
    home.stateVersion = params.stateVersion;

    home.sessionPath = [
        "$HOME/bin"
        "$HOME/.cargo/bin"
    ];

    home.file = {
        ".local/share" = { source = ../local_share; recursive = true; };
        ".config"      = { source = ../config;      recursive = true; };
        "bin"          = { source = ../bin;         recursive = true; };
        ".cargo"       = { source = ../config_home/cargo;   recursive = true; };
        # ".vimrc".source = ./home/.vimrc;
    };

    home.sessionVariables = {
        RUSTUP_DIST_SERVER = "https://mirrors.tuna.tsinghua.edu.cn/rustup";
        RUSTUP_UPDATE_ROOT = "https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup";
        GTK_IM_MODULE = "fcitx";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
    };
}
