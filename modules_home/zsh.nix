let params = import ../params.nix; in
{
    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        shellAliases = params.shellAliases;
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