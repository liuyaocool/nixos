{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager";
    # 跟nixpkgs使用相同版本
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  #outputs = inputs@{ self, nixpkgs, ... }: {
  outputs = { self, nixpkgs, home-manager, ... }: 
    let
      # 在这里统一定义公共变量
      common = {
        stateVersion = "26.05";
      };
    in {
    # NOTE: 'nixos' is the default hostname
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit common; }; # 只传递给configuration.nix
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager 
          {
              home-manager.extraSpecialArgs = { inherit common; };
              home-manager.users.liuyao = import ./home.nix;
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

