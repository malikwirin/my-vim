{ nvf, pkgs }:

{
  vim = { config ? {} }: (nvf.lib.neovimConfiguration {
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
