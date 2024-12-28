return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true })  -- Switch buffers
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true })  -- Help tags
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { noremap = true, silent = true })   -- Recent files
      vim.keymap.set('n', '<leader>fc', builtin.commands, { noremap = true, silent = true })   -- Commands
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}

