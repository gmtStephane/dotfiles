---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>tc"] = { "<cmd> GoTestSubCase -v -F<CR>", "go test subcase", opts = { nowait = true } },
    ["<leader>tf"] = { "<cmd> GoTestFile -v -F<CR>", "go test file", opts = { nowait = true } },
    ["<leader>tp"] = { "<cmd> GoTestPkg -v -F<CR>", "go test package", opts = { nowait = true } },
    ["<leader>tt"] = { "<cmd>GoAltV<CR>", "go toggle test", opts = { nowait = true } },
    ["<leader>gr"] = { "<cmd> GoGenReturn <CR>", "generate return statement", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
  i ={
    ["<C-f>"] = { "<cmd> GoFillStruct <CR>", "go fill struct", opts = { nowait = true } },
  }
}

-- more keybinds!

return M
