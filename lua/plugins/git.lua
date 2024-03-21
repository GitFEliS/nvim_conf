return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = function()
			local neogit = require("neogit")
			neogit.setup({
				integrations = {
					telescope = require("telescope"),
					diffview = require("diffview"),
				},
			})
		vim.keymap.set("n", "<leader>ng", ":Neogit<Enter>", {desc = "Neogit"})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",

		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					map("n", "[c", function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					map("n", "<leader>hs", gs.stage_hunk, {desc = "stage hunk"})
					map("n", "<leader>hr", gs.reset_hunk, {desc = "reset hunk"})
					map("n", "<leader>hp", gs.preview_hunk, {desc = "preview_hunk"})
					map("n", "<leader>hd", gs.diffthis, {desc = "diffthis"})
				end,

				current_line_blame = true,
				current_line_blame_opts = {
					delay = 5000,
				},
			})
		end,
	},
}
