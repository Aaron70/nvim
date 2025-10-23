{ pkgs, categories, ... }: 

with pkgs; { 
  lspsAndRuntimeDeps = {
    deps = [
      fd
      gcc
      git
      lazygit
      ripgrep
    ];
    lua = { lsp = with pkgs; [ lua-language-server ]; };
    nix = { lsp = with pkgs; [ nix-doc nixd ]; };
    harper = { lsp = with pkgs; [ harper ]; };
    go = { 
      defautl = with pkgs; [
        gotools
        go-tools
      ];
      lsp = with pkgs; [ gopls ]; 
      debug = with pkgs; [ delve ]; 
    };
    typescript = {
      lps = with pkgs; [
        typescript-go
        tailwindcss-language-server
        vscode-langservers-extracted
      ];
    };
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
        nvim-treesitter.withAllGrammars
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
    lua = { lps = with pkgs.vimPlugins; [ lazydev-nvim ]; };
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
        ts-comments-nvim
        fidget-nvim
        render-markdown-nvim
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
      extra = with pkgs.vimPlugins; [
        neoscroll-nvim
        todo-comments-nvim
      ];
    };
    apis = with pkgs.vimPlugins; [ rest-nvim ];
    typescript = {
      default = with pkgs.vimPlugins; [
        nvim-ts-autotag
      ];
    };
    formatter = {
      default = with pkgs.vimPlugins; [ conform-nvim ];
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
