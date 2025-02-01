vim.api.nvim_create_user_command("Quit", function()
	local tab_count = vim.fn.tabpagenr("$")
	local bufs = vim.fn.getbufinfo({ buflisted = 1 })
	local buf_count = #bufs
	local current_buf = vim.api.nvim_get_current_buf()

	if tab_count > 1 then
		vim.cmd("tabclose")
	elseif buf_count > 1 then
		local next_buf = bufs[2] and bufs[2].bufnr or bufs[1].bufnr
		vim.api.nvim_set_current_buf(next_buf)
		vim.cmd("bdelete " .. current_buf)
	else
		vim.cmd("enew")
	end
end, {})

vim.api.nvim_create_user_command("Q", "Quit", {})
vim.api.nvim_create_user_command("Wq", "w | Quit", {})
vim.api.nvim_create_user_command("WQ", "w | Quit", {})
vim.api.nvim_create_user_command("X", "x | Quit", {})
