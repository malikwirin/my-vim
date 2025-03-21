{ config }:

{
  assistant = import ./assistant;
  autocomplete = import ./autocomplete;
  binds = import ./binds;
  filetree = import ./filetree;
  formatter.conform-nvim.enable = true;
  git = import ./git;
  globals.mapleader = " ";
  keymaps = import ./keymaps;
  languages = import ./languages;
  lsp = import ./lsp;
  minimap.minimap-vim.enable = true;

  notes = {
    orgmode = {
      # enable = true;
      # treesitter.enable = false;
    };

    todo-comments.enable = true;
  };

  options = import ./options;

  spellcheck = {
    enable = true;
    languages = ["en" "de" "eo"];
    programmingWordlist.enable = true;
  };

  statusline.lualine.enable = true;
  treesitter.enable = true;
  ui = import ./ui;
  useSystemClipboard = true;
  utility = import ./utility;
  visuals = import ./visuals;
}
