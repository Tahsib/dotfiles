return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup{
      size = 15,
      open_mapping = [[<c-\>]],
      on_open = function()
        vim.cmd("startinsert")  -- Automatically start in terminal mode
      end,
      on_close = function()
        vim.cmd("wincmd p")
      end,
      auto_scroll = true,
      autochdir = true,
    }
  -- Keybinding to jump from toggleterm to file buffer or vice versa
  vim.keymap.set('n', '<C-c>', function()
      -- Check if we're in a terminal window
      local term_win = vim.fn.bufwinid("toggleterm")
      if term_win ~= -1 then
        -- If in terminal, switch to the previous window (file buffer)
        vim.cmd("wincmd p")
      else
        -- If not in terminal, open toggleterm and go to terminal mode
        vim.cmd("ToggleTerm")
        vim.cmd("startinsert")
      end
    end, { noremap = true, silent = true })

  -- Keybinding to exit terminal mode and jump to file window
  vim.keymap.set('t', '<C-c>', [[<C-\><C-n><C-w>p]], { noremap = true, silent = true })
  end,
}
