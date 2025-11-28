return {
  'nvim-treesitter/nvim-treesitter',
  tag = 'v0.10.0',
  lazy = false,
  build = ":TSUpdate",
  config = function ()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'javascript', 'typescript', 'jsdoc', 'scss',
        'vim', 'vimdoc', 'lua', 'query',
        'bash', 'graphql', 'json5', 'terraform',
      },

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,

      indent = { enable = true },
      highlight = { enable = true },
    })
  end
}
