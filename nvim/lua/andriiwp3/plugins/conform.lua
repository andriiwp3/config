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
	lsp_format = "fallback",
	timeout_ms = 500,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { "prettierd", "prettier", stop_after_first = true },
     		 },
    },
}
