-- [[
-- Adds a list of formatters by filetype, sets up formatting on save and adds a shortcut to run a formatter
-- See: https://github.com/stevearc/conform.nvim
-- ]]

return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        { 'nvim-tree/nvim-web-devicons' }
    },
    config = function()
        require("nvim-tree").setup({
            filters = {
                dotfiles = true,
            },
        })
    end,
}
