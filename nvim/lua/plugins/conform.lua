return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt" },
			-- Conform will run the first available formatter
			javascript = { "prettier" },
			typescript = { "prettier" },
			php = { "pretty-php" },
			blade = { "blade-formatter" },
			html = { "prettier" },
			css = { "prettier" },
			markdown = { "prettier" },
			-- nix = { "alejandra" },
			twig = { "twig-cs-fixer" },
		},
		formatters = {
			prettier = {
				-- these options will be passed to Prettier CLI
				prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
			},
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 3000,
			lsp_format = "fallback",
		},
	},
}
