return {
  {
    -- LSP support
    "neoclide/coc.nvim",
    branch = "release"
  },

  "github/copilot.vim",

  -- Auto-close parenthesis, bracket, quotes, etc
  "cohama/lexima.vim",

  -- Haskell language support
  "neovimhaskell/haskell-vim",

  -- nodejs ecosystem
  'neovim/nvim-lspconfig',
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',
  {
    'mattn/emmet-vim',
    init = function ()
      vim.cmd("let g:user_emmet_mode='a'")
      vim.cmd("let g:user_emmet_install_global = 0")
      vim.cmd("let g:user_emmet_leader_key=','")
      vim.cmd("autocmd FileType html,css,typescriptreact,vue EmmetInstall")
    end
  },

  -- Purescript
  { "purescript-contrib/purescript-vim" },

  -- golang
  { "fatih/vim-go" },

  -- markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- eslint
  {
    'esmuellert/nvim-eslint',
    config = function()
      require('nvim-eslint').setup({})
    end,
  },

  { 'adimit/prolog.vim' },
}
