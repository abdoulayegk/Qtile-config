local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1

local function conf(name)
	return function()
		require(name)
	end
end

return {
	-- Core libraries
	{ "nvim-lua/plenary.nvim", lazy = true },

	-- Colorschemes
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = conf("user.colorscheme"),
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
	},

	-- UI and appearance
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = conf("user.nvim-tree"),
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = conf("user.lualine"),
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = false,
		config = conf("user.toggleterm"),
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		config = conf("user.indentline"),
	},
	{
		"goolord/alpha-nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = conf("user.alpha"),
	},
	{
		"RRethy/vim-illuminate",
		event = "BufReadPost",
		config = conf("user.illuminate"),
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPost",
		config = conf("user.colorizer"),
	},
	{
		"lewis6991/impatient.nvim",
		lazy = false,
		config = conf("user.impatient"),
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "moll/vim-bbye", event = "VeryLazy" },

	-- Navigation and search
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
		config = conf("user.telescope"),
	},
	{
		"nanotee/zoxide.vim",
		event = "VeryLazy",
	},
	{
		"lexay/telescope-zoxide.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nanotee/zoxide.vim",
		},
		config = function()
			local ok, telescope = pcall(require, "telescope")
			if ok then
				telescope.load_extension("zoxide")
			end
		end,
	},

	-- Treesitter & syntax
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		event = { "BufReadPost", "BufNewFile" },
		config = conf("user.treesitter"),
	},

	-- Editing enhancements
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = conf("user.autopairs"),
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = conf("user.comment"),
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- Completion & snippets
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			{
				"L3MON4D3/LuaSnip",
				build = not is_windows and "make install_jsregexp" or nil,
				dependencies = { "rafamadriz/friendly-snippets" },
			},
		},
		config = conf("user.cmp"),
	},

	-- LSP & tools
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"nvimtools/none-ls.nvim",
				dependencies = { "nvim-lua/plenary.nvim" },
			},
		},
		config = conf("user.lsp"),
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = conf("user.gitsigns"),
	},
	{ "averms/black-nvim", ft = { "python" } },
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
	{ "elkowar/yuck.vim", ft = { "yuck" } },

		-- Debugging
		{
			"mfussenegger/nvim-dap",
			dependencies = {
				"rcarriga/nvim-dap-ui",
				"ravenxrz/DAPInstall.nvim",
			},
			config = conf("user.dap"),
		},
}
