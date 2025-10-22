{
  # The name here is the name of the package
  # and the default command name for it.
  nvim = { pkgs, ... }: {
    settings = {
      aliases = [ "vim" ];
      wrapRc = false;
      # configDirName = "nvim";
      # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.keovim;
    };
    categories = {
      essentials = true;
      optionals = true;
      themer = true;
      colorscheme = "tokyonight";
      formatter = true;
      lua = true;
      nix = true;
      go = true;
      harper = true;
      typescript = true;
      apis = true;
    };
    extra = {
      nixdExtras = { nixpkgs = ''import ${pkgs.path} {}''; };
    };
  };
}
