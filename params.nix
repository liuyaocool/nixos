{
    username = "liuyao";
    stateVersion = "26.05";
    system = "x86_64-linux";
    hosts = {
        "192.168.8.29" = [
            "fs.com"
            "ws.com"
            "w.com" "note.w.com" "hello.w.com"
        ];
    };
    sshKeys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHTCQa5ztJIg85TWfwux5DZ2DxCDjn1/XaOCVbMWHWtC w10885"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEXzB9QbF8tqsWCmmWuKYwLjclOpprJfi0NtcpcTWLTU u0_a249@localhost"
    ];
    shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake path:$HOME/nixos";
        rebuildt = "nixos-rebuild switch --flake path:$HOME/nixos";
        ra = "ranger";
        mem-usage = "smem -tk";
        pkg-search = "nix search nixpkgs ";
        gd = "git diff";
        gs = "git status";
        gu = "git pull";
    };
    git_name = "ly_nix";
}
