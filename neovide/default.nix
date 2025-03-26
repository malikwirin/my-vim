{ pkgs ? import <nixpkgs> { }, vim ? pkgs.neovim }:

let
  settings = {
    neovim-bin = "${vim}/bin/nvim";
  };
  settingsFormat = pkgs.formats.toml { };
  configToml = settingsFormat.generate "config.toml" settings;
in
pkgs.symlinkJoin {
  name = "neovide";
  paths = [ pkgs.neovide ];
  buildInputs = [ pkgs.makeWrapper ];
  postBuild = ''
    mkdir -p $out/etc/neovide

    cp ${configToml} $out/etc/neovide/config.toml

    wrapProgram $out/bin/neovide \
      --set NEOVIDE_CONFIG_DIR $out/etc/neovide
  '';
}
