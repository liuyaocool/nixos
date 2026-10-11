let params = import ../params.nix; in
{
    users.users.${params.username} = {
        isNormalUser = true;
        description = params.username;
        extraGroups = [ "networkmanager" "wheel" "uinput" ];
        openssh.authorizedKeys.keys = params.sshKeys;
    };
}