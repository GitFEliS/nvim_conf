return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "gopls", "hyprls", "cmake", "terraformls", "tflint" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "Fildo7525/pretty_hover",
      "saghen/blink.cmp",
    },
    opts = {
      servers = {
        gopls = {},
        clangd = {},
        lua_ls = {},
        cmake = {
          cmd = {
            "cmake-language-server",
          },
          filetypes = {
            "cmake",
          },
          init_options = {
            buildDirectory = "build",
          },
        },
        hyprls = {},
        terraformls = {},
        tflint = {},
        rust_analyzer = {},
      },
    },
    config = function(_, opts)
      local lsp_conf = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lsp_conf[server].setup(config)
      end

      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "prev diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })
      vim.keymap.set("n", "<leader>H", require("pretty_hover").hover, { desc = "hover" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to defenition" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "go to implementation" })
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "type definition" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "go to references" })
    end,
  },
}
