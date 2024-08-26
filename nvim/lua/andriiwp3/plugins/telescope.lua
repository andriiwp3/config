-- [[ 
-- Adds fuzzy finder over lists
-- See: https://github.com/nvim-telescope/telescope.nvim 
-- ]]

return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      -- [[
      -- https://github.com/nvim-lua/plenary.nvim
      -- ]]
      { 'nvim-lua/plenary.nvim' },

      -- [[
      -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
      -- ]]
      {
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be installed and loaded
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },

      -- [[
      -- https://github.com/nvim-telescope/telescope-ui-select.nvim
      -- ]]
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- [[
      -- Useful for getting pretty icons (requires a Nerd Font)
      -- https://github.com/nvim-tree/nvim-web-devicons
      -- ]]
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end
}
