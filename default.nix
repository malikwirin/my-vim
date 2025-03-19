{ nvf, pkgs }:

let
  defaultConfig = { };
in rec {
  default = vim.default;
  vim = rec {
    default = withConfig defaultConfig;
    
    withConfig = { config ? { } }: (nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [
        {
          config.vim = import ./vim {
            inherit config;
          } // (config.programs.nvf.vim or {});
        }
      ];
    }).neovim;
  };
  
  neovide = {
    default = import ./neovide {
      inherit pkgs;
      vim = default;
    };

    withConfig = { config ? { } }:
      let
        vim = vim.withConfig {
          config = config;
        };
      in
      import ./neovide {
        inherit pkgs vim;
      };
  };

}
