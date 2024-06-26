require("catppuccin").setup({
	-- undercurl = true,
	-- underline = true,
	-- bold = true,
	-- italic = true,
	-- strikethrough = true,
	-- invert_selection = false,
	-- invert_signs = false,
	-- invert_tabline = false,
	-- invert_intend_guides = false,
	-- inverse = true, -- invert background for search, diffs, statuslines and errors
	-- contrast = "", -- can be "hard", "soft" or empty string
	-- palette_overrides = {},
	-- overrides = {},
	-- dim_inactive = false,
	transparent_background = false,
	-- transparent_mode = false,

	color_overrides = {
		mocha = {
			base = "#000000",
			mantle = "#000000",
			crust = "#000000",
		},
	},
})
vim.cmd("colorscheme catppuccin")
