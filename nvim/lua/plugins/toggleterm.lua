return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup{
      size = 15,
      open_mapping = [[<c-\>]],
      auto_scroll = true,
      autochdir = true,
    }
  end,
}
