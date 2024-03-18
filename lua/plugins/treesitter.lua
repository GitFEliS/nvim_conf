return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "cpp", "lua", "vim", "vimdoc", "python", "go", "sql", "yaml" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
