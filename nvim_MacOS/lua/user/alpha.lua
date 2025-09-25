local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
-- dashboard.section.header.val = {
-- 	"                                                     ",
-- 	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
-- 	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
-- 	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
-- 	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
-- 	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
-- 	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
-- 	"                                                     ",
-- }

-- Set menu
-- dashboard.section.buttons.val = {
-- 	dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
-- 	dashboard.button("f", "  > Find file", ":cd $HOME/.config/nvim/ | Telescope find_files<CR>"),
-- 	dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
-- 	dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
-- 	dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
-- }

local logo = [[
                                                    
             ████ ██████           █████      ██
            ███████████             █████ 
            █████████ ███████████████████ ███   ███████████
           █████████  ███    █████████████ █████ ██████████████
          █████████ ██████████ █████████ █████ █████ ████ █████
        ███████████ ███    ███ █████████ █████ █████ ████ █████
       ██████  █████████████████████ ████ █████ █████ ████ ██████
    ]]

dashboard.section.header.val = vim.split(logo, "\n")
dashboard.section.buttons.val = {
	dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
	dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
	dashboard.button("s", " " .. "Restore Session", '<cmd>lua require("persistence").load()<cr>'),
	dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/ <CR>"),
	-- dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
	dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
