{ pkgs, ... }:
{
    hardware.enableAllFirmware = true;
    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            intel-vaapi-driver
            # mesa
        ];
    };
}