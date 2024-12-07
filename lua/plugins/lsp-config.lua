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
		},
		config = function()
			local lsp_conf = require("lspconfig")
			lsp_conf.lua_ls.setup({})
			lsp_conf.clangd.setup({
				cmd = {
					"clangd",
					"--offset-encding=utf-8",
				},
			})
			lsp_conf.cmake.setup({
				cmd = {
					"cmake-language-server",
				},
				filetypes = {
					"cmake",
				},
				init_options = {
					buildDirectory = "build",
				},
			})
			lsp_conf.gopls.setup({})
			lsp_conf.hyprls.setup({})
			lsp_conf.terraformls.setup({})
      lsp_conf.tflint.setup({})
			lsp_conf.rust_analyzer.setup({})

			--local pretty_hover = require("pretty_hover")

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
