{ pkgs, ... }:
let params = import ../params.nix; in
{
    networking.firewall.allowedTCPPorts = [ 8080 ];

    services.nginx = {
        enable = true;
        additionalModules = [
            # 加这一个会自动启动 自带dav 和 webdav-ext
            pkgs.nginxModules.dav
        ];

        virtualHosts."webdav.local" = {
            listen = [ { addr = "0.0.0.0"; port = 8080; } ];
            locations."/" = {
                # 改回标准路径
                root = "/var/lib/webdav";
                extraConfig = ''
                dav_methods PUT DELETE MKCOL COPY MOVE;
                dav_ext_methods PROPFIND OPTIONS;
                dav_access user:rw group:rw all:r;
                client_max_body_size 10G;

                # 防止目录为空时浏览器访问报 403
                autoindex on;
                '';
            };
        };
    };

    systemd.tmpfiles.rules = [
        # sudo chown -R nginx:nginx /var/lib/webdav
        # sudo chown 775 /var/lib/webdav
        # 确保目录存在， 且 nginx 用户和组有权访问
        "d /var/lib/webdav 0775 nginx nginx -"
    ];

    # 将你的主用户 加入 nginx 用户组， 方便你直接在本地读写这个文件夹
    users.users.${params.username}.extraGroups = [ "nginx" ];
}

