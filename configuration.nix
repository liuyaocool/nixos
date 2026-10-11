let params = import ./params.nix; in
{
    imports = [
        ./hardware-configuration/macmini.nix
        ./modules_sys/boot.nix
        ./modules_sys/hardware.nix
        ./modules_sys/i18n.nix
        ./modules_sys/input_method.nix
        ./modules_sys/network.nix
        ./modules_sys/openssh.nix
        ./modules_sys/pkgs.nix
        ./modules_sys/settings.nix
        ./modules_sys/sudo_rules.nix
        ./modules_sys/user.nix
        ./modules_sys/xserver.nix

        ./modules_sys/hyprland.nix
        ./modules_sys/nginx.nix
        ./modules_sys/podman.nix
        ./modules_sys/sublime.nix
        ./modules_sys/sunshine.nix
    ];

    system.stateVersion = params.stateVersion;
    time.timeZone = "Asia/Shanghai";

    # services.pipewire = {
    #   enable = true;
    #   pulse.enable = true;
    #   alsa.enable = true;
    # };
}
