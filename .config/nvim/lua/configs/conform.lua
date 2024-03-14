local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofumpt", "goimports" },
	},
}

require("conform").setup(options)
