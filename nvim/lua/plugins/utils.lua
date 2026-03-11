return {
  -- "gcc" to comment out a line
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
  -- Visual indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  -- Auto-close brackets, quotes, etc.
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  }
}
