{ pkgs, ... }:
{
    system.activationScripts.installSublime = ''
        if [ ! -d /opt/sublime_text ]; then
            echo "====== Installing Sublime Text ======"
            tmpdir=$(mktemp -d)
            cat ${../soft/sublime_text_4134.aa} ${../soft/sublime_text_4134.ab} > $tmpdir/sublime.zip
            mkdir -p /opt
            ${pkgs.unzip}/bin/unzip $tmpdir/sublime.zip -d /opt
            rm -rf $tmpdir
            echo "====== Installing Sublime Text Finished ======"
        else
            echo "====== Sublime exists, skip ======"
        fi
    '';
}