return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "bash",
        "dockerfile",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "hcl",
        "html",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "terraform",
        "vim",
        "vimdoc",
        "yaml",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
