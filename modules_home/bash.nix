let params = import ../params.nix; in
{
    programs.bash = {
        enable = true;
        shellAliases = params.shellAliases;
    };
}