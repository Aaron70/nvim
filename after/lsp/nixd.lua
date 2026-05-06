return {
  cmd = { "nixd" },
  settings = {
    nixd = {
      nixpkgs = {
        -- For flake.
        -- This expression will be interpreted as "nixpkgs" toplevel
        -- Nixd provides package, lib completion/information from it.
        -- Resource Usage: Entries are lazily evaluated, entire nixpkgs takes 200~300MB for just "names".
        -- Package documentation, versions, are evaluated by-need.
        expr = "import (builtins.getFlake(toString ./.)).inputs.nixpkgs { }",
      },
      formatting = {
        command = { "alejandra" }, -- or nixfmt or nixpkgs-fmt
      },
      options = {
        nixos = {
          expr = '(let pkgs = import "${flake.inputs.nixpkgs}" { }; inherit (pkgs) lib; in (lib.evalModules { modules = (import "${flake.inputs.nixpkgs}/nixos/modules/module-list.nix") ++ [ ({...}: { nixpkgs.hostPlatform = builtins.currentSystem; }) ]; check = false; })).options',
        },
        nix_darwin = {
          expr = '(let pkgs = import "${flake.inputs.nixpkgs}" { }; inherit (pkgs) lib; in (lib.evalModules { modules = (import "${flake.inputs.nix-darwin}/modules/module-list.nix"); check = false; })).options',
        },
        home_manager = {
          expr = '(let pkgs = import "${flake.inputs.nixpkgs}" { }; lib = import "${flake.inputs.home-manager}/modules/lib/stdlib-extended.nix" pkgs.lib; in (lib.evalModules { modules = (import "${flake.inputs.home-manager}/modules/modules.nix") { inherit lib pkgs; check = false; }; })).options',
        },
      },
    },
  },
}
