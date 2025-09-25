local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
	return
end

-- Use modern key mapping function
vim.keymap.set('n', '<a-n>', '<cmd>lua require"illuminate".goto_next_reference{wrap=true}<cr>', {noremap=true})
vim.keymap.set('n', '<a-p>', '<cmd>lua require"illuminate".goto_prev_reference{wrap=true}<cr>', {noremap=true})

illuminate.configure {
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  delay = 200,
  filetypes_denylist = {
    "dirvish",
    "fugitive",
    "alpha",
    "NvimTree",
    "packer",
    "lazy",
    "neogitstatus",
    "Trouble",
    "lir",
    "Outline",
    "spectre_panel",
    "toggleterm",
    "DressingSelect",
    "TelescopePrompt",
  },
  filetypes_allowlist = {},
  modes_denylist = {},
  modes_allowlist = {},
  providers_regex_syntax_denylist = {},
  providers_regex_syntax_allowlist = {},
  under_cursor = true,
}
