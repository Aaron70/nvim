inputs: {
  wlib,
  pkgs,
  ...
}: {
  imports = [wlib.wrapperModules.neovim];

  # choose a directory for your config.
  config.settings.config_directory = ./.;
  config.extraPackages = with pkgs; [
    # Dependencies
    gcc
    cargo
    lazygit
    git

    # tree-sitter-cli
    tree-sitter

    # Language Servers
    lua-language-server
    nixd
    typescript-go
    tailwindcss-language-server
    vscode-langservers-extracted
    jdt-language-server

    alejandra # Nix Formatter
  ];
  config.specs.general = {
    data = with pkgs.vimPlugins; [
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
    ];
  };
  # you can also use an impure path!
  # config.settings.config_directory = lib.generators.mkLuaInline "vim.fn.stdpath('config')";
  # config.settings.config_directory = "/home/<USER>/.config/nvim";
  # If you do that, it will not be provisioned by nix, but it will have normal reload for quick edits!

  # If you want to install multiple neovim derivations via home.packages or environment.systemPackages
  # in order to prevent path collisions:

  # set this to true:
  # config.settings.dont_link = true;

  # and make sure these dont share values:
  # config.binName = "nvim";
  # config.settings.aliases = [ ];
}
