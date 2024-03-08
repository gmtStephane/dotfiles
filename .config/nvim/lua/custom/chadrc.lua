---@type ChadrcConfig
local M = {}

M.ui = { theme = 'gruvbox' }
M.plugins = "custom.plugins"

vim.filetype.add({ extension = { templ = "templ" } })


return M
