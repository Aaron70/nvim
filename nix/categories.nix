{ pkgs, categories, ... }: 

with pkgs; { 
  lspsAndRuntimeDeps = {
    deps = [
      git
      lazygit
    ];
    lua = { lsp = with pkgs; [ lua-language-server ]; };
    nix = { lsp = with pkgs; [ nix-doc nixd ]; };
  };
  startupPlugins = {
    deps = with pkgs.vimPlugins; [
      plenary-nvim
      nui-nvim
      nvim-notify
      nvim-web-devicons
    ];
    essentials = {
      default = with pkgs.vimPlugins; [
        lazy-nvim
        neo-tree-nvim
        nvim-lspconfig
        nvim-treesitter
        nvim-treesitter-textobjects
      ];
      blink = with pkgs.vimPlugins; [
        blink-cmp
        blink-compat
        cmp-cmdline
        luasnip
        colorful-menu-nvim
      ];
    };
    themer = with pkgs.vimPlugins; (builtins.getAttr (categories.colorscheme or "tokyonight") {
        # Theme switcher without creating a new category
        "onedark" = onedark-nvim;
        "catppuccin" = catppuccin-nvim;
        "catppuccin-mocha" = catppuccin-nvim;
        "tokyonight" = tokyonight-nvim;
        "tokyonight-day" = tokyonight-nvim;
      }
    );
  };
  optionalPlugins = {
    essentials = {
      optionals = with pkgs.vimPlugins; [
        lualine-nvim
        comment-nvim
        fidget-nvim
      ];
    };
    optionals = {
      default = with pkgs.vimPlugins; [
        undotree
        noice-nvim
        lazygit-nvim
        flash-nvim
        gitsigns-nvim
        which-key-nvim
      ];
      telescope = with pkgs.vimPlugins; [
        telescope-nvim
        telescope-fzf-native-nvim
        telescope-ui-select-nvim
      ];
    };
    typescript = {
      default = with pkgs.vimPlugins; [
        nvim-ts-autotag
      ];
    };
  };
  sharedLibraries = {};
  environmentVariables = {};
  extraWrapperArgs = {};
  extraCats = {
    essentials = [ 
      [ "deps" ] 
      [ "essentials" "default" ]
      [ "essentials" "extra" ]
    ];
    optionals = [ 
      [ "deps" ] 
      [ "optionals" "default" ]
    ];
  };
}
