{
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
}
