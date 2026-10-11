{
    services.webdav = {
        enable = true;
        user = "liuyao";
        settings = {
            address = "0.0.0.0";
            port = 3100;
            directory = "/home/liuyao/webdav";
            permissions = "R";
            users = [
                {
                    username = "liuyao";
                    password = "666666";
                }
            };
    };
}