{ pkgs, ... }: 

with pkgs; { 
  lspsAndRuntimeDeps = {
    essentials = [
      git
    ];
  };
  startupPlugins = {
    essentials =  with pkgs.vimPlugins; [
      pkgs.vimPlugins.lazy-nvim
      plenary-nvim
      lazygit
    ];
  };
  optionalPlugins = {};
  sharedLibraries = {};
  environmentVariables = {
  };
  extraWrapperArgs = {};
  extraCats = { };
}
