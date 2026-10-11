{ config, ... }:
{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.extraModulePackages = with config.boot.kernelPackages; [
        broadcom_sta
    ];
    boot.kernelModules = [
        "wl"
    ];
    boot.blacklistedKernelModules = [
        "b43"
        "bcma"
        "ssb"
    ];
}