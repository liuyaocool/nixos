let params = import ../params.nix; in
{
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "start-hyprland";
                user = params.username;
            };
            initial_session = {
                command = "start-hyprland";
                user = params.username;
                
            };
        };
    };
}
