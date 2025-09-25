if type(vim.lsp) ~= "table" then
  vim.api.nvim_err_writeln("Neovim LSP client not available")
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
