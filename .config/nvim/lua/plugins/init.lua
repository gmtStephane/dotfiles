return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("go").setup {
        textobjects = false,
      }
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup {
        defaults = {
          file_ignore_patterns = { "mock" },
        },
        pickers = {
          find_files = {
            -- Additional configuration for find_files if needed
          },
          lsp_implementations = {
            -- Additional configuration for lsp_implementations if needed
          },
          lsp_definitions = {
            -- Additional configuration for lsp_definitions if needed
          },
          lsp_document_symbols = {
            -- Additional configuration for lsp_document_symbols if needed
          },
          lsp_references = {
            -- Additional configuration for lsp_references if needed
          },
        },
        extensions = {
          -- Your existing extensions
        },
      }
      -- -- Key mappings for Telescope commands
      -- local map = vim.api.nvim_set_keymap
      -- local options = { noremap = true, silent = true, desc = "Telescope" }
      --
      -- map("n", "<leader>gi", ":Telescope lsp_implementations<CR>", options)
      -- map("n", "<leader>gd", ":Telescope lsp_definitions<CR>", options)
      -- map("n", "<leader>gs", ":Telescope lsp_document_symbols<CR>", options)
      -- map("n", "<leader>gr", ":Telescope lsp_references<CR>", options)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { -- optional packages
      "nvim-treesitter/nvim-treesitter",
    },
    ft = {
      "go",
    },
    config = function()
      require "configs.textobjects"
    end,
  },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
