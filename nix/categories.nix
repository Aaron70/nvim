{ pkgs, ... }: 

with pkgs; { 
  lspsAndRuntimeDeps = {
    deps = [
      git
      lazygit
    ];
  };
  startupPlugins = {
    deps = with pkgs; [
      vimPlugins.plenary-nvim
      vimPlugins.nui-nvim
      vimPlugins.nvim-notify
      vimPlugins.nvim-web-devicons
    ];
    essentials = {
      default = with pkgs; [
        vimPlugins.lazy-nvim
        vimPlugins.neo-tree-nvim
      ];
      optionals = with pkgs; [
        vimPlugins.comment-nvim
      ];
    };
    optionals = {
      default = with pkgs; [
        vimPlugins.lazygit-nvim
      ];
    };
  };
  optionalPlugins = {};
  sharedLibraries = {};
  environmentVariables = {};
  extraWrapperArgs = {};
  extraCats = {
    essentials = [ 
      [ "deps" ] 
      [ "essentials" "default" ]
      [ "essentials" "extra" ]
    ];
  };
}
