-- ln 's' plugins.lua ~/.config/nvim/lua/plugins

local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
   -- opts = override
  },
  {
    "tpope/vim-sensible",
    lazy = false,
  },
  {
    "preservim/nerdtree",
    lazy = false,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
   {
    "aymericbeaumet/vim-symlink",
    lazy = false,
  },
    {
    "moll/vim-bbye",
    lazy = false,
  },
  {"chrisbra/improvedft", lazy = false,}
  }
  
  return plugins