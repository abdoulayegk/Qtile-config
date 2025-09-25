local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
	return
end

ibl.setup({
	indent = {
		char = "▏",
	},
	scope = {
		enabled = true,
	},
	whitespace = {
		remove_blankline_trail = true,
	},
	exclude = {
		buftypes = { "terminal", "nofile" },
		filetypes = { "help", "packer", "lazy", "NvimTree" },
	},
})
