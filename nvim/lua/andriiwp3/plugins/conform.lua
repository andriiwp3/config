-- [[
-- Adds a list of formatters by filetype, sets up formatting on save and adds a shortcut to run a formatter
-- See: https://github.com/stevearc/conform.nvim
-- ]]

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd', 'eslint_d' },
      typescript = { 'prettierd', 'eslint_d' },
      javascriptreact = { 'prettierd', 'eslint_d' },
      typescriptreact = { 'prettierd', 'eslint_d' },
      json = { 'prettierd' },
      vue = { 'prettierd', 'eslint_d' },
      markdown = { 'markdownlint' },
    },
  },
}
