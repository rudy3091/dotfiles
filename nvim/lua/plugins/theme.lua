return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },

  {
    "cranberry-clockworks/coal.nvim",
    priority = 1000,
    config = function()
      require('coal').setup()
      vim.cmd([[colorscheme coal]])
    end
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
