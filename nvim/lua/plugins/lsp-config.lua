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
        automatic_enable = false,
        ensure_installed = {
          "docker_compose_language_service",
          "dockerls",
          "lua_ls",
          "gopls",
          "html",
          "pylsp",
          "rust_analyzer",
          "terraformls",
          "ts_ls",
          "yamlls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "b0o/SchemaStore.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      if vim.lsp.config then
        vim.lsp.config("*", { capabilities = capabilities })
      end

      local servers = {
        docker_compose_language_service = {
          filetypes = { "yaml" },
        },
        dockerls = {},
        lua_ls = {},
        gopls = {
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork" },
          root_dir = function(bufnr, on_dir)
            local fname = type(bufnr) == "number" and vim.api.nvim_buf_get_name(bufnr) or bufnr
            local root = vim.fs.root(fname, { "go.work", "go.mod", ".git" }) or vim.fs.dirname(fname)
            if on_dir then
              on_dir(root)
            end
            return root
          end,
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
            },
          },
        },
        html = {},
        pylsp = {},
        rust_analyzer = {},
        terraformls = {
          filetypes = { "terraform", "tf" },
          init_options = {
            ignoreSingleFileWarning = true,
          },
          on_attach = function() end,
        },
        ts_ls = {},
        yamlls = {
          filetypes = { "yaml" },
          settings = {
            yaml = {
              schemaStore = {
                enable = false,
                url = "",
              },
              schemas = {
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/pod-v1.json"] = {
                  "*pod*.yaml",
                  "*pod*.yml",
                  "pod.yaml",
                  "pod.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/deployment-apps-v1.json"] = {
                  "*deployment*.yaml",
                  "*deployment*.yml",
                  "*deploy*.yaml",
                  "*deploy*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/service-v1.json"] = {
                  "*service*.yaml",
                  "*service*.yml",
                  "*svc*.yaml",
                  "*svc*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/configmap-v1.json"] = {
                  "*configmap*.yaml",
                  "*configmap*.yml",
                  "*cm*.yaml",
                  "*cm*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/secret-v1.json"] = {
                  "*secret*.yaml",
                  "*secret*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/ingress-networking-v1.json"] = {
                  "*ingress*.yaml",
                  "*ingress*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/daemonset-apps-v1.json"] = {
                  "*daemonset*.yaml",
                  "*daemonset*.yml",
                  "*ds*.yaml",
                  "*ds*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/statefulset-apps-v1.json"] = {
                  "*statefulset*.yaml",
                  "*statefulset*.yml",
                  "*sts*.yaml",
                  "*sts*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/job-batch-v1.json"] = {
                  "*job*.yaml",
                  "*job*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/cronjob-batch-v1.json"] = {
                  "*cronjob*.yaml",
                  "*cronjob*.yml",
                  "*cj*.yaml",
                  "*cj*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/namespace-v1.json"] = {
                  "*namespace*.yaml",
                  "*namespace*.yml",
                  "*ns*.yaml",
                  "*ns*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/persistentvolumeclaim-v1.json"] = {
                  "*pvc*.yaml",
                  "*pvc*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/persistentvolume-v1.json"] = {
                  "*pv*.yaml",
                  "*pv*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/serviceaccount-v1.json"] = {
                  "*serviceaccount*.yaml",
                  "*serviceaccount*.yml",
                  "*sa*.yaml",
                  "*sa*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/role-rbac-v1.json"] = {
                  "*role*.yaml",
                  "*role*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/rolebinding-rbac-v1.json"] = {
                  "*rolebinding*.yaml",
                  "*rolebinding*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/clusterrole-rbac-v1.json"] = {
                  "*clusterrole*.yaml",
                  "*clusterrole*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/clusterrolebinding-rbac-v1.json"] = {
                  "*clusterrolebinding*.yaml",
                  "*clusterrolebinding*.yml",
                },
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/networkpolicy-networking-v1.json"] = {
                  "*networkpolicy*.yaml",
                  "*networkpolicy*.yml",
                  "*netpol*.yaml",
                  "*netpol*.yml",
                },
                ["http://json.schemastore.org/kustomization"] = "kustomization.yaml",
                ["http://json.schemastore.org/chart"] = "Chart.yaml",
              },
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
      vim.keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
      end, { desc = "Previous Diagnostic" })
      vim.keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
      end, { desc = "Next Diagnostic" })
    end,
  },
}
