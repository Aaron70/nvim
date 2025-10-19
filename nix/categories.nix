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
    essentials =  with pkgs; [
      vimPlugins.lazy-nvim
      vimPlugins.lazygit-nvim
      vimPlugins.neo-tree-nvim
    ];
  };
  optionalPlugins = {};
  sharedLibraries = {};
  environmentVariables = {};
  extraWrapperArgs = {};
  extraCats = {
    essentials = [ [ "deps" ] ];
  };
}
