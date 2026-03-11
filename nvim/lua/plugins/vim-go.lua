-- ~/.config/nvim/lua/plugins/vim-go.lua

return {
  'fatih/vim-go',  -- Plugin name

  -- Optional custom configuration (inside 'config' function)
  config = function()
    -- Vim-go specific setup
    vim.g.go_fmt_command = "goimports"  -- Use goimports for auto-formatting
    vim.g.go_auto_type_info = 1  -- Show type information on hover
    vim.g.go_doc_popup = 1  -- Enable Go doc popup on hover
    vim.g.go_highlight_types = 1  -- Enable highlighting of Go types
  end
}

