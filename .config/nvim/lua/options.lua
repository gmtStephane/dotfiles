require("nvchad.options")

vim.opt.relativenumber = true

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.cmd("startinsert") -- starts in insert mode
		vim.wo.number = false -- no absolute numbers
		vim.wo.relativenumber = false -- no relative numbers
	end,
})

vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter" }, {
	pattern = "*",
	callback = function()
		vim.wo.signcolumn = "no" -- no sign column
	end,
})
