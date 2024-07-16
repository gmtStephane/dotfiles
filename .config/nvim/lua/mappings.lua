require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<C-d>", "<C-d>zz", { remap = true, desc = "Center cursor after moving down half-page" })
map("n", "<C-u>", "<C-u>zz", { remap = true, desc = "Center cursor after moving up half-page" })
map(
	"n",
	"]]",
	":TSTextobjectGotoNextStart @function.outer | lua vim.cmd('norm zz') <CR>",
	{ remap = true, desc = "Go to next function and center the cursor" }
)

map(
	"n",
	"[[",
	":TSTextobjectGotoPreviousStart @function.outer | lua vim.cmd('norm zz') <CR>",
	{ remap = true, desc = "Go to previous function and center the cursor" }
)


vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
