{ pkgs, ... }:
{
    programs.waybar = {
        enable = true;
    };
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
}