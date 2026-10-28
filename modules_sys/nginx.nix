{ pkgs, lib, ... }:
let 
    params = import ../params.nix;
    # 1. 把整个 nginx 目录（含 conf.d）构建到 Nix Store
    nginxConfigDir = pkgs.runCommand "my-nginx" {} ''
        mkdir -p $out/conf
        cp -r ${../config_home}/nginx/conf/conf.d  $out/conf
        cp ${../config_home}/nginx/conf/nginx.conf $out/conf
        cp ${pkgs.mailcap}/etc/nginx/mime.types    $out/conf/mime.types
        cp ${../soft}/fs $out
    '';
in
{
    networking.firewall.allowedTCPPorts = [ 80 ];

    services.nginx = {
        enable = true;
        additionalModules = [
            # 自动启动: 自带dav 和 webdav-ext
            pkgs.nginxModules.dav
        ];
        # services.nginx.appendHttpConfig = builtins.readFile ./nginx/xxx.conf;
    };

    # -p 指定配置文件路径
    systemd.services.nginx.serviceConfig.ExecStart = lib.mkForce ''
        ${pkgs.nginx}/bin/nginx -g 'daemon off;' -p ${nginxConfigDir}
    '';
    # systemd.services.nginx.serviceConfig.ProtectHome = "read-only";

    systemd.tmpfiles.rules = [
        # sudo chown -R nginx:nginx /var/lib/webdav
        # sudo chown 775 /var/lib/webdav
        # 确保目录存在， 且 nginx 用户和组有权访问
        "d /var/lib/nginx 0775 nginx nginx -"
        "Z /var/lib/nginx - nginx nginx -"
    ];

    # 将你的主用户 加入 nginx 用户组， 方便你直接在本地读写这个文件夹
    users.users.${params.username}.extraGroups = [ "nginx" ];

    systemd.services.file-system = {
        description = "fs";
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
            ExecStart = "${nginxConfigDir}/fs 3000 /var/lib/nginx/data ";
            User = "nginx";
            Group = "nginx";
            Restart = "on-failure";
        };
    };
}

