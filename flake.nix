{
  description = "My personal Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
  };

  outputs = { nixpkgs, ... }@inputs: 
  let 
    inherit (inputs.nixCats) utils;
    luaPath = ./nvim;
    defaultPackageName = "nvim";
    forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;

    categoryDefinitions = import ./nix/categories.nix;
    packageDefinitions = import ./nix/packages.nix;
    dependencyOverlays = [];
    extra_pkg_config = {};
  in forEachSystem 
  (
    system: 
    let
      nixCatsBuilder = utils.baseBuilder luaPath { inherit nixpkgs system dependencyOverlays extra_pkg_config; } categoryDefinitions packageDefinitions;
      defaultPackage = nixCatsBuilder defaultPackageName;
      pkgs = import nixpkgs { inherit system; };
    in {
      packages = utils.mkAllWithDefault defaultPackage;

      devShells = {
        default = pkgs.mkShell {
          name = defaultPackageName;
          packages = [ defaultPackage ];
          inputsFrom = [ ];
          shellHook = ''
          '';
        };
      };
    }) // rec {
        nixosModule = utils.mkNixosModules {
          moduleNamespace = [ defaultPackageName ];
          inherit defaultPackageName dependencyOverlays luaPath
            categoryDefinitions packageDefinitions extra_pkg_config nixpkgs;
        };

        homeModule = utils.mkHomeModules {
          moduleNamespace = [ defaultPackageName ];
          inherit defaultPackageName dependencyOverlays luaPath
            categoryDefinitions packageDefinitions extra_pkg_config nixpkgs;
        };

        nixosModules.default = nixosModule;
        homeModules.default = homeModule;
    };
}
