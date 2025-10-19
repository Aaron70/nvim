-- This will allow to run the neovim configuration from
-- a non-nix installation
require('nixCatsUtils').setup { non_nix_value = true }
require("config.non_nix_download")

