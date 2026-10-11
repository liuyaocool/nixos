let params = import ../params.nix; in
{
    programs.git = {
        enable = true;
        settings.user = {
            name  = params.git_name;
            email = "${params.git_name}@gmail.com";
        };
    };
}