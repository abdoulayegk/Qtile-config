local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

local pre_hook
local ts_pre_hook_ok, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
if ts_pre_hook_ok then
	pre_hook = ts_comment.create_pre_hook()
end

comment.setup({
	pre_hook = pre_hook,
})
