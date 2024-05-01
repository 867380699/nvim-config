return {
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").create_default_mappings() -- s/S to jump2D
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({
				indent = { char = "▏" },
				scope = {
					show_start = false,
				},
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		setup = function()
			require("colorizer").setup({})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({}) -- ys/ds/cs
		end,
	},
	{
		"RRethy/vim-illuminate", -- highlighting cursor word
		config = function()
			require("illuminate").configure({
				min_count_to_highlight = 2,
			})
		end,
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		config = function()
			require("barbar").setup({
				animation = false,
				sidebar_filetypes = {
					["neo-tree"] = true,
				},
				icons = {
					buffer_index = true,
				},
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
	},
}
