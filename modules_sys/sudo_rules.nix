let params = import ../params.nix; in
{
    security.sudo.extraRules = [{
        users = [params.username];
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
    }];
}