return {
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { -- optional packages
			"nvim-treesitter/nvim-treesitter",
		},
		ft = {
			"go",
		},
		-- lazy = false,
		config = function()
			require("configs.treesitter-textobjects")
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup({
				gocoverage_sign = "║",
			})
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
}
