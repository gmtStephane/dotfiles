require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", "<leader>tt", ":GoAltV <CR>", { desc = "Go Toggle Test Vert" })
map("n", "<leader>tF", ":GoTestFile -v -F <CR>", { desc = "GoTestFile" })
map("n", "<leader>tf", ":GoTestFunc -v -F <CR>", { desc = "GoTestFunc" })

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- local nomap = vim.keymap.del
-- nomap("n", "gi")
map("n", "<leader>fi", ":Telescope lsp_implementations<CR>", { desc = "Telescope lsp_implementations" })
map("n", "<leader>fd", ":Telescope lsp_definitions<CR>", { desc = "Telescope lsp_definitions" })
map("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", { desc = "Telescope document symbols" })
map("n", "<leader>fr", ":Telescope lsp_references<CR>", { desc = "Telescope lsp_references" })

map("n", "<leader>gg", ":LazyGit <CR>", { desc = "LazyGit" })
