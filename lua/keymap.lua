local function nmap(k, v)
	vim.keymap.set("n", k, v, { silent = true })
end

local function imap(k, v)
	vim.keymap.set("i", k, v, { silent = true })
end

nmap("<ESC>", function()
	vim.cmd.nohlsearch()
	vim.cmd.echo()
end)

imap("<C-A>", "<C-O>^")
imap("<C-E>", "<C-O>$")
imap("<C-X>", "<C-O>dd")
imap("<C-Z>", "<C-O>u")
imap("<C-S-Z>", "<C-O><C-R>")
