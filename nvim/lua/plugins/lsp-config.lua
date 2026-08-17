return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "gopls",
          "golangci_lint_ls",
          "html",
          "pylsp",
          "terraformls",
          "yamlls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/SchemaStore.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local has_schemastore, schemastore = pcall(require, "schemastore")
      local yaml_schemas = has_schemastore and schemastore.yaml.schemas() or {}

      local servers = {
        lua_ls = {},
        gopls = {
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          root_dir = function(fname)
            return vim.fs.root(fname, { "go.work", "go.mod", ".git" })
          end,
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
            },
          },
        },
        golangci_lint_ls = {},
        html = {},
        pylsp = {},
        terraformls = {},
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = false,
                url = "",
              },
              schemas = vim.tbl_extend("force", yaml_schemas, {
                kubernetes = {
                  "*.k8s.yaml",
                  "*.k8s.yml",
                  "k8s/**/*.yaml",
                  "k8s/**/*.yml",
                  "manifests/**/*.yaml",
                  "manifests/**/*.yml",
                  "**/*k8s*/**/*.yaml",
                  "**/*k8s*/**/*.yml",
                  "*deployment*.yaml",
                  "*service*.yaml",
                  "*pod*.yaml",
                  "*ingress*.yaml",
                  "*daemonset*.yaml",
                  "*statefulset*.yaml",
                  "*configmap*.yaml",
                  "*secret*.yaml",
                  "*.yaml",
                  "*.yml",
                },
                ["http://json.schemastore.org/kustomization"] = "kustomization.yaml",
                ["http://json.schemastore.org/chart"] = "Chart.yaml",
              }),
              validate = true,
              completion = true,
              hover = true,
            },
          },
        },
      }

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        if vim.lsp.config then
          vim.lsp.config(server, config)
          vim.lsp.enable(server)
        else
          require("lspconfig")[server].setup(config)
        end
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Hover Docs" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Line Diagnostics" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
    end,
  },
}
