{
  description = "My personal Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
  };

  outputs = { nixpkgs, ... }@inputs: 
  let 
    inherit (inputs.nixCats) utils;
    luaPath = ./.;
    forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;
    defaultPackageName = "nvim";

    dependencyOverlays = [];
    extra_pkg_config = {};
    categoryDefinitions = {...}:{};
  in forEachSystem 
  (
    system: 
    let
      nixCatsBuilder = utils.baseBuilder luaPath { inherit nixpkgs system dependencyOverlays extra_pkg_config; } categoryDefinitions packageDefinitions;
      defaultPackage = nixCatsBuilder defaultPackageName;
      pkgs = import nixpkgs { inherit system; };


      packageDefinitions = {
        # The name here is the name of the package
        # and also the default command name for it.
        nvim = { pkgs, ... }: {
          settings = {
            aliases = [ "vim" ];
            wrapRc = true; # TODO: Change this to false
            # configDirName = "nixCats-nvim";
            # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
          };
          categories = {};
          extra = {};
        };
      };
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
    }
  );
}
