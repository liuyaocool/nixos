{
    nix.settings = {
        substituters = [
            "https://mirrors.ustc.edu.cn/nix-channels/store"
            "https://cache.nixos.org/"
        ];
        experimental-features = [
            "nix-command"
            "flakes"
        ];
    };
}