local M = {}

M.options = {
  nvchad_branch = "v2.0",
}

M.ui = {
  ------------------------------- base46 -------------------------------------
  override = {
    NvDashAscii = { bg = "#0E2738", fg = "red" }
  },
  -- hl = highlights
  hl_add = {
    NvDashAscii = { bg = "#0E2738", fg = "red" }
  },
  hl_override = {
    NvDashAscii = { bg = "#0E2738", fg = "red" }
  },
  changed_themes = {
    gruvchad = {
      base_30 = {
        statusline_bg = "#1e2122",
        black2 = "#1e2122"
      }
    }
  },
  -- theme_toggle = { "onedark", "one_light" },
  theme = "onedark",          -- default theme
  transparency = false,
  lsp_semantic_tokens = true, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens

  -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
  extended_integrations = {}, -- these aren't compiled by default, ex: "alpha", "notify"

  -- cmp themeing
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default",            -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg",     -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  telescope = { style = "borderless" }, -- borderless / bordered

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    overriden_modules = function(modules)
      table.remove(modules, 10)
      table.remove(modules, 9)
      table.remove(modules, 8)
    end,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    overriden_modules = function(modules)
      table.remove(modules, 4)
    end
    ,
  },

  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,

    header = {
      "                    .                    ",
      "    ##############..... ##############   ",
      "    ##############......##############   ",
      "      ##########..........##########     ",
      "      ##########........##########       ",
      "      ##########.......##########        ",
      "      ##########.....##########..        ",
      "      ##########....##########.....      ",
      "    ..##########..##########.........    ",
      "  ....##########.#########.............  ",
      "    ..################JJJ............    ",
      "      ################.............      ",
      "      ##############.JJJ.JJJJJJJJJJ      ",
      "      ############...JJ...JJ..JJ  JJ     ",
      "      ##########....JJ...JJ..JJ  JJ      ",
      "      ########......JJJ..JJJ JJJ JJJ     ",
      "      ######    .........                ",
      "                  .....                  ",
      "                    .                    ",
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  cheatsheet = { theme = "simple" }, -- simple/grid

  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = false,
      silent = true, -- silences 'no signature help available' message from appearing
    },
  },
}

M.plugins = ""                                    -- path i.e "custom.plugins", so make custom/plugins.lua file

M.lazy_nvim = require "plugins.configs.lazy_nvim" -- config for lazy.nvim startup options

M.mappings = require "core.mappings"

return M
