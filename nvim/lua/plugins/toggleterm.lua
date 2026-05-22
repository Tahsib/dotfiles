return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<c-\>]],
      on_open = function()
        vim.cmd("startinsert") -- Automatically start in terminal mode
      end,
      on_close = function()
        vim.cmd("wincmd p")
      end,
      auto_scroll = true,
      autochdir = true,
    })
    -- Keybinding to open toggleterm with leader
    vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", { desc = "Toggle Terminal", noremap = true, silent = true })
  end,
}
