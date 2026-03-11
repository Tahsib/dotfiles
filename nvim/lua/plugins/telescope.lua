return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers", noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags", noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Recent Files", noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "Commands", noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "Document Symbols" })
      vim.keymap.set('n', '<leader>fw', builtin.lsp_dynamic_workspace_symbols, { desc = "Workspace Symbols" })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "Search Diagnostics" })
      vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "Git Status" })
      vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "Git Commits" })
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

