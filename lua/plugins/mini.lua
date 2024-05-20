return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.basics").setup({
			options = { basic = false },
			mappings = {
				-- gO/go to put empty line above/below
				-- gy/gp to copy/paste system clipboard
				-- <C-S> to save
				basic = true,
				windows = true, -- Window navigation with <C-hjkl>, resize with <C-arrow>
			},
			autocommands = { basic = false },
		})

		require("mini.misc").setup() -- put to print lua variable

		require("mini.trailspace").setup()

		-- [B[b]b]B => first/backword/forward/last
		-- B:Buffer C:Comment X:Confilct D:Diagnostic F:File I:Indent J:Jumplist L:Locationlist
		-- O:Oldfile Q:Quickfix T:Treesitter U:Undo W:Window Y:Yank
		require("mini.bracketed").setup()

		require("mini.comment").setup() -- comment with gc/gcc

		vim.keymap.set("i", "<C-/>", "<C-O>gcc", { remap = true })
		vim.keymap.set("n", "<C-/>", "gcc", { remap = true })

		-- Extend f, F, t, T to work on multiple lines
		-- Repeat jump by pressing f, F, t, T again.
		require("mini.jump").setup()

		-- ga/gA to start
		-- s:split j:justify m:merge
    require('mini.align').setup()
	end,
}
