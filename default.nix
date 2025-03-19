{ nvf, pkgs }:

let
  defaultConfig = { };
in rec {
  default = vim;
  vim = vimWithConfig defaultConfig;

  neovide = import ./neovide {
    inherit pkgs vim;
  };

  vimWithConfig = { config ? { } }: (nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [
        {
          config.vim = import ./vim {
            inherit config;
          } // (config.programs.nvf.vim or {});
        }
      ];
    }).neovim;
}
