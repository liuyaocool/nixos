{
    imports = [
        ./modules_home/bash.nix
        ./modules_home/git.nix
        ./modules_home/home.nix
        ./modules_home/pkgs.nix
        ./modules_home/vim.nix
        ./modules_home/waybar.nix
        ./modules_home/zsh.nix
    ];
    fonts.fontconfig.enable = true;
}
