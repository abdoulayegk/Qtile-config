# Neovim Configuration

Opinionated Neovim setup built on top of **lazy.nvim**. It focuses on fast startup, a dark Catppuccin-themed UI, and a ready-to-use workflow for web and Python development (HTML/CSS/TypeScript, Lua, Python, C/C++).

## Requirements

- Neovim 0.9+ (tested on 0.11.x)
- Git
- Recommended: `ripgrep` and `fd` for Telescope, `cmake` for the Telescope FZF native extension, and `node`/`npm` for Markdown preview builds
- Python 3 available on your PATH (the config auto-detects the host interpreter)

## Installation

1. Back up any existing configuration: `mv ~/.config/nvim ~/.config/nvim.bak`
2. Clone this project into `~/.config/nvim`:
   ```bash
   git clone <repo-url> ~/.config/nvim
   ```
3. Launch Neovim: `nvim`

On the first start Lazy will install plugins automatically. If anything fails, run:

```vim
:Lazy sync
:Mason
:TSUpdate
```

`markdown-preview.nvim` needs a one-time build. Run `:Lazy build markdown-preview.nvim` (requires `npm`).

## Highlights

- **Plugin management**: lazy.nvim with a lockfile for reproducible installs
- **UI**: Catppuccin theme, lualine statusline, bufferline tabs, alpha dashboard, indent guides, floating toggleterm, and nvim-tree file browser
- **Productivity**: Telescope (with FZF), autopairs, Comment.nvim, nvim-surround, illuminate, colorizer, Markdown preview
- **LSP**: mason.nvim + mason-lspconfig automatically set up these servers: `lua_ls`, `cssls`, `html`, `ts_ls`, `pyright`, `jsonls`, `clangd`
- **Completion**: nvim-cmp + LuaSnip with buffer/path/LSP sources and Ghost text preview
- **Formatting/Diagnostics**: none-ls (Prettier, Black, Stylua, clang-format, markdownlint) with format-on-save where supported
- **Debugging**: nvim-dap with DAP UI and LazyGit toggle through toggleterm

## Key Mappings

| Mapping                                                                                 | Description                                             |
| --------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| `<Space>`                                                                               | Leader key                                              |
| `<leader>e`                                                                             | Toggle nvim-tree                                        |
| `<leader>ff` / `<leader>ft` / `<leader>fb`                                              | Telescope find files / live grep / buffers              |
| `<leader>gg`                                                                            | Toggle LazyGit terminal                                 |
| `<leader>/`                                                                             | Toggle line comment                                     |
| `<leader>m`                                                                             | Toggle Markdown preview in markdown buffers             |
| `jj` (insert mode)                                                                      | Exit to Normal mode                                     |
| `<C-\>`                                                                                 | Open floating terminal (toggleterm)                     |
| `F9`                                                                                    | Run current file (Python, C/C++, JS) via shell commands |
| DAP: `<leader>db`, `<leader>dc`, `<leader>di`, `<leader>do`, `<leader>dr`, `<leader>dt` | Debug controls                                          |

Standard window moves (`<C-h/j/k/l>`), buffer navigation (`<S-h>`, `<S-l>`), resizing (`<C-Up/Down/Left/Right>`), and clipboard integration are enabled by default. See `lua/user/keymaps.lua` for the full set.

## Language Servers & Formatting

- Servers are declared in `lua/user/lsp/mason.lua`. Open `:Mason` to install missing ones or add new entries to the `servers` table.
- Formatting on save is provided by none-ls. To disable per buffer run `:autocmd LspFormatting` and clear, or edit `lua/user/lsp/null-ls.lua`.
- Completion is configured in `lua/user/cmp.lua`; adjust sources or keymaps there.

## Treesitter

Treesitter ensures syntax highlighting, indentation, and comment-context for Lua, Markdown, Bash, and Python. Python highlighting currently falls back to the built-in highlighter (see `lua/user/treesitter.lua`) because the upstream parser needs an update; remove `"python"` from the disable list once you rebuild the parser with `:TSInstallSync python`.

## Troubleshooting

- `:Lazy` – view plugin status, rebuild failed plugins, or sync updates
- `:Mason` – manage language servers, formatters, linters
- `:LspInfo` – check active LSP clients for the current buffer
- `:checkhealth` – inspect missing dependencies
- Run `:messages` if you see startup errors

## Customisation tips

- Change core options in `lua/user/options.lua`
- Add/remove plugins in `lua/user/plugins.lua`
- Update UI behaviour (themes, statusline, etc.) through the modules under `lua/user/`
- Keymaps live in `lua/user/keymaps.lua`, autocommands in `lua/user/autocommands.lua`

Enjoy hacking! If you add new language servers or formatters, keep the lockfile (`lazy-lock.json`) up to date by running `:Lazy sync` before committing.
