return {
  "fatih/vim-go",
  config = function()
    vim.g.go_fmt_command = "goimports"
    vim.g.go_fmt_autosave = 0
    vim.g.go_auto_type_info = 0
    vim.g.go_doc_popup = 0
    vim.g.go_gopls_enabled = 0
    vim.g.go_code_completion_enabled = 0
    vim.g.go_def_mapping_enabled = 0
    vim.g.go_doc_keywordprg_enabled = 0
    vim.g.go_highlight_types = 1
  end,
}
