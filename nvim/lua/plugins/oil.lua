return {
  'stevearc/oil.nvim',
  opts = {
    -- Show file icons
    columns = { "icon" },
    -- Window settings
    view_options = {
      show_hidden = true,
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(_, opts)
    require("oil").setup(opts)
    -- Leader + - (dash) to open the file browser
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory with Oil" })
  end,
}
