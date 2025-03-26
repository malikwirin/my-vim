let
  enableLanguages = languages:
    builtins.listToAttrs (map
      (name: {
        inherit name;
        value = { enable = true; };
      })
      languages);
in
{
  enableDAP = true;
  enableExtraDiagnostics = true;
  enableFormat = true;
  enableLSP = true;
  enableTreesitter = true;

  markdown.extensions.render-markdown-nvim.enable = true;
  rust.crates.enable = true;
  typst.extensions.typst-preview-nvim.enable = true;
} // enableLanguages [
  "bash"
  "clang"
  "css"
  "go"
  "haskell"
  "html"
  "java"
  "kotlin"
  "lua"
  "markdown"
  "nim"
  "nix"
  "ocaml"
  "python"
  "rust"
  "sql"
  "ts"
  "typst"
  "yaml"
]
