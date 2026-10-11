{ pkgs, ... }:
{
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