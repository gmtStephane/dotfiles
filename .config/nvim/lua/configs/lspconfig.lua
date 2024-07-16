local nvchad_on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- Custom on_attach function
local function custom_on_attach(client, bufnr)
  -- Call the original on_attach function from NvChad
  nvchad_on_attach(client, bufnr)

  -- Additional key mapping for Telescope
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<Cmd>Telescope lsp_implementations<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>Telescope lsp_definitions<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<Cmd>Telescope lsp_document_symbols<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<Cmd>Telescope lsp_references<CR>", opts)

-- map("n", "<leader>gi", ":Telescope lsp_implementations<CR>", { desc = "Telescope lsp_implementations" })
-- map("n", "<leader>gd", ":Telescope lsp_definitions<CR>", { desc = "Telescope lsp_definitions" })
-- map("n", "<leader>gs", ":Telescope lsp_document_symbols<CR>", { desc = "Telescope document symbols" })
-- map("n", "<leader>gr", ":Telescope lsp_references<CR>", { desc = "Telescope lsp_references" })
end

local servers = { "gopls" }

-- LSP setup with the custom on_attach function
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

