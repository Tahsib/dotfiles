return {
  "fatih/vim-go",
  config = function()
    vim.g.go_fmt_command = "goimports"
    vim.g.go_auto_type_info = 1
    vim.g.go_doc_popup = 1
    vim.g.go_highlight_types = 1
  end,
}
