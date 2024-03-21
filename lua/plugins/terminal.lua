return {
	{
		"voldikss/vim-floaterm",
		config = function()
			-- require("vim-floaterm")
			vim.keymap.set("n", "<F1>", ":FloatermToggle<CR>", {desc = "FloatermToggle"})
		end,
	},
}
