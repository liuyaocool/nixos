{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager";
        # 跟nixpkgs使用相同版本
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    #outputs = inputs@{ self, nixpkgs, ... }: {
    outputs = { self, nixpkgs, home-manager, ... }: 
    let params = import ./params.nix; in
    {
        # NOTE: 'nixos' is the default hostname
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = params.system;
            modules = [
                ./configuration.nix
                home-manager.nixosModules.home-manager 
                {
                    home-manager.users.${params.username} = import ./home.nix;
                    home-manager.backupFileExtension = "bak"; # .${toString builtins.currentTime}
                }
            ];
        };
      # standalone模式: 独立安装home-manager推荐， nixos不需要这样写
      # homeConfigurations.nixos = home-manager.lib.homeManagerConfiguration {
      #     inherit pkgs;
      #     modules = [./home.nix];
      # };
    };
}

