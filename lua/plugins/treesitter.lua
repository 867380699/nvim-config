return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"vimdoc",
				"bash",
				"javascript",
				"python",
				"markdown",
				"markdown_inline",
				"css",
				"html",
				"json",
				"yaml",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
