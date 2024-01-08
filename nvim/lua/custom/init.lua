local function openTelescope(defaultText)
  return function()
    require("telescope.builtin").find_files {
      default_text = defaultText .. " ",
      prompt_title = "Find Files",
      cwd = vim.fn.getcwd(),
    }
  end
end
--
vim.keymap.set("n", "<Leader>ft", openTelescope(".templ"))
vim.keymap.set("n", "<Leader>fg", openTelescope(".go"))
vim.keymap.set("n", "<Leader>fs", openTelescope(".sql"))
-- vim.keymap.set("n", "<Leader>fi", openTelescope('/internal/implementation/'))
-- vim.keymap.set("n", "<Leader>fr", openTelescope('/internal/implementation/repository/rds/'))
-- vim.keymap.set("n", "<Leader>fb", openTelescope('/internal/business/'))
-- vim.keymap.set("n", "<Leader>fd", openTelescope('/deploy/'))

vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx" })
vim.o.foldlevel = 20
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
  group = format_sync_grp,
})
vim.filetype.add {
  extension = {
    templ = "templ",
  },
}
vim.api.nvim_create_autocmd({
  -- 'BufWritePre' event triggers just before a buffer is written to file.
  "BufWritePre",
}, {
  pattern = { "*.templ" },
  callback = function()
    -- Format the current buffer using Neovim's built-in LSP (Language Server Protocol).
    vim.lsp.buf.format()
  end,
})

vim.g.webdevicons_override = {
  templ = { filetype = "templ", icon = "", color = "#b48ead" },
}
