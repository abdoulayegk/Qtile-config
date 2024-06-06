-- local present, nvimtree = pcall(require, "nvim-tree")
--
-- if not present then
-- 	return
-- end
--
-- nvimtree.setup({
-- 	auto_reload_on_write = true,
-- 	create_in_closed_folder = false,
-- 	disable_netrw = false,
-- 	hijack_cursor = true,
-- 	hijack_netrw = false,
-- 	hijack_unnamed_buffer_when_opening = false,
-- 	ignore_buffer_on_setup = false,
-- 	open_on_setup = false,
-- 	open_on_setup_file = false,
-- 	open_on_tab = false,
-- 	sort_by = "name",
-- 	update_cwd = false,
-- 	reload_on_bufenter = true,
-- 	respect_buf_cwd = false,
-- 	ignore_ft_on_setup = { "alpha" },
-- 	view = {
-- 		adaptive_size = false,
-- 		centralize_selection = false,
-- 		width = 30,
-- 		hide_root_folder = true,
-- 		side = "left",
-- 		preserve_window_proportions = false,
-- 		number = false,
-- 		relativenumber = false,
-- 		signcolumn = "yes",
-- 		mappings = {
-- 			custom_only = false,
-- 			list = {
-- 				-- user mappings go here
-- 			},
-- 		},
-- 		float = {
-- 			enable = true,
-- 			open_win_config = {
-- 				relative = "cursor",
-- 				border = "rounded",
-- 				row = 1,
-- 				col = 1,
-- 			},
-- 		},
-- 	},
-- 	renderer = {
-- 		add_trailing = false,
-- 		group_empty = false,
-- 		highlight_git = true,
-- 		full_name = false,
-- 		highlight_opened_files = "name",
-- 		root_folder_modifier = ":~",
-- 		indent_markers = {
-- 			enable = false,
-- 			icons = {
-- 				corner = "└ ",
-- 				edge = "│ ",
-- 				item = "│ ",
-- 				none = "  ",
-- 			},
-- 		},
-- 		icons = {
-- 			webdev_colors = true,
-- 			git_placement = "before",
-- 			padding = " ",
-- 			symlink_arrow = "->",
-- 			show = {
-- 				file = true,
-- 				folder = true,
-- 				folder_arrow = true,
-- 				git = true,
-- 			},
-- 			glyphs = {
-- 				default = "",
-- 				symlink = "",
-- 				folder = {
-- 					arrow_closed = "",
-- 					arrow_open = "",
-- 					default = "",
-- 					open = "",
-- 					empty = "",
-- 					empty_open = "",
-- 					symlink = "",
-- 					symlink_open = "",
-- 				},
-- 				git = {
-- 					unstaged = "✗",
-- 					staged = "✓",
-- 					unmerged = "",
-- 					renamed = "➜",
-- 					untracked = "★",
-- 					deleted = "",
-- 					ignored = "◌",
-- 				},
-- 			},
-- 		},
-- 	},
-- 	hijack_directories = {
-- 		enable = true,
-- 		auto_open = true,
-- 	},
-- 	update_focused_file = {
-- 		enable = true,
-- 		update_cwd = false,
-- 		ignore_list = {},
-- 	},
-- 	system_open = {
-- 		cmd = "",
-- 		args = {},
-- 	},
-- 	diagnostics = {
-- 		enable = true,
-- 		show_on_dirs = true,
-- 		icons = {
-- 			hint = " ",
-- 			info = " ",
-- 			warning = " ",
-- 			error = " ",
-- 		},
-- 	},
-- 	filters = {
-- 		dotfiles = false,
-- 	},
-- 	git = {
-- 		enable = true,
-- 		ignore = true,
-- 		timeout = 400,
-- 	},
-- 	actions = {
-- 		use_system_clipboard = true,
-- 		change_dir = {
-- 			enable = true,
-- 			global = false,
-- 			restrict_above_cwd = false,
-- 		},
-- 		expand_all = {
-- 			max_folder_discovery = 300,
-- 		},
-- 		open_file = {
-- 			quit_on_open = false,
-- 			resize_window = true,
-- 			window_picker = {
-- 				enable = true,
-- 				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
-- 				exclude = {
-- 					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
-- 					buftype = { "nofile", "terminal", "help" },
-- 				},
-- 			},
-- 		},
-- 		remove_file = {
-- 			close_window = true,
-- 		},
-- 	},
-- 	trash = {
-- 		cmd = "gio trash",
-- 		require_confirm = true,
-- 	},
-- 	live_filter = {
-- 		prefix = "[FILTER]: ",
-- 		always_show_folders = true,
-- 	},
-- 	log = {
-- 		enable = false,
-- 		truncate = false,
-- 		types = {
-- 			all = false,
-- 			config = false,
-- 			copy_paste = false,
-- 			diagnostics = false,
-- 			git = false,
-- 			profile = false,
-- 			watcher = false,
-- 		},
-- 	},
-- })
-- ---------------------------------------------------------------
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	renderer = {
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	view = {
		width = 25,
		side = "left",
		mappings = {
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
	},
})
