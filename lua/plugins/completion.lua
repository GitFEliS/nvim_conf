return {
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally

	version = "v0.*",

	-- optional: provides snippets for the snippet source
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	event = "InsertEnter",

	opts = {

		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- see the "default configuration" section below for full documentation on how to define
		-- your own keymap.
		keymap = { preset = "enter" },

		appearance = {
			use_nvim_cmp_as_default = true,

			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		completion = {
			accept = {
				-- experimental auto-brackets support
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				border = "rounded",
				winblend = 0,
				scrollbar = true,
				draw = {
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = "rounded",
					winblend = 0,

					scrollbar = true,
				},
			},
			ghost_text = {
				enabled = vim.g.ai_cmp,
			},
		},

		-- default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, via `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			cmd = {},
		},

		-- experimental signature help support
		signature = {
			enabled = true,
			window = {
				border = "rounded",
				winblend = 0,
				scrollbar = true,
			},
		},

		fuzzy = {
			-- when enabled, allows for a number of typos relative to the length of the query
			-- disabling this matches the behavior of fzf
			use_typo_resistance = true,
			-- frencency tracks the most recently/frequently used items and boosts the score of the item
			use_frecency = true,
			-- proximity bonus boosts the score of items matching nearby words
			use_proximity = true,
			max_items = 200,
			-- controls which sorts to use and in which order, these three are currently the only allowed options
			sorts = { "label", "kind", "score" },
		},
	},
	-- allows extending the providers array elsewhere in your config
	-- without having to redefine it
	opts_extend = { "sources.default" },
	config = function(_, opts)
		require("blink.cmp").setup(opts)
	end,
}
