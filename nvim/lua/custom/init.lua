local SQLBuilder = require "custom.sql.builder"
local SQLJSON = require "custom.sql.runner"

-- Define the function to execute the SQL builder and print the query for "sepa_sdde" table
function List(table, id, ...)
  local query = SQLBuilder.new(id):setTable(table):parse({ ... }):build()
  SQLJSON(query)
end

-- Load Telescope
-- local telescope = require('lua.plugins.configs.telescope')
function TablePicker(opts, id)
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local conf = require("telescope.config").values
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"

  local selection = {}
  opts = opts or {}
  pickers
      .new(opts, {
        prompt_title = "Tables",
        finder = finders.new_table {
          results = { "sepa_sdde", "sepa_message", "jos_am_order", "jos_am_user", "jos_am_list" },
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local res = action_state.get_selected_entry()
            List(res[1], id)
          end)
          return true
        end,
      })
      :find()
end

Pick = function()
  TablePicker(require("telescope.themes").get_dropdown {})
end

PickWithID = function()
  local current_word = vim.fn.expand "<cword>"
  TablePicker(require("telescope.themes").get_dropdown {}, current_word)
end

local function openTelescope(path)
  return function()
    require("telescope.builtin").find_files { prompt_title = "Find Files", cwd = vim.fn.getcwd() .. path}
  end
end

-- Example key mapping
vim.api.nvim_set_keymap("n", "<Leader>fpa", [[:lua Pick()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fpi", [[:lua PickWithID()<CR>]], { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>ft", openTelescope('/internal/transport/'))
vim.keymap.set("n", "<Leader>fi", openTelescope('/internal/implementation/'))
vim.keymap.set("n", "<Leader>fr", openTelescope('/internal/implementation/repository/rds/'))
vim.keymap.set("n", "<Leader>fb", openTelescope('/internal/business/'))
vim.keymap.set("n", "<Leader>fd", openTelescope('/deploy/'))

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
