{ pkgs, ... }:
{
    # 允许非自由软件
    nixpkgs.config.allowUnfree = true;
    # 允许不安全的包
    # nixpkgs.config.allowInsecurePredicate = pkg: builtins.elem (lib.getName pkg) [
    #   "broadcom-sta"
    # ];
    nixpkgs.config.permittedInsecurePackages = [
        "broadcom-sta-6.30.223.271-59-6.18.38"
    ];
    environment.systemPackages = with pkgs; [
    ];
    
    programs.nano.enable = false;
 
    programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
            gtk3
            glib
            libGL
            libX11
            cairo
            pango

            #      gobject-introspection
            #      atk
            #      gdk-pixbuf
            #      harfbuzz
            #      libXext
            #      libXrender
            #      libXrandr
            #      libXi
            #      libXcursor
            #      libxcb
            #      libxkbcommon
            #      zlib
            #      openssl
        ];
    };
}