{ lib, ... }:
let params = import ../params.nix; in
{
    networking.hostName = "nixos";
    networking.networkmanager.enable = true;
    networking.hosts = params.hosts;

    networking.firewall = {
        allowedTCPPorts = [
            9202
            #47984 47989 47990 48010 # sunshine
        ];
        allowedUDPPorts = [
            #47998 47999 48000 48002 48010 # sunshine
        ] 
        # ++ lib.range 46998 48000 # sunshine
        ;
    };
}