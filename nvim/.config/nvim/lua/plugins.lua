-- Paketlarni yuklash
vim.pack.add({
	{ src = "https://github.com/bluz71/vim-moonfly-colors", name = "moonfly" },
	{ src = "https://github.com/folke/tokyonight.nvim", name = "tokyonight" },
	{ src = "https://github.com/nyoom-engineering/oxocarbon.nvim", name = "oxocarbon" },
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/rcarriga/nvim-notify" },
	{ src = "https://github.com/nvim-mini/mini.statusline" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})

-- Color theme
vim.opt.background = "dark"
vim.cmd([[colorscheme moonfly]])

-- Noice & Notify
require("noice").setup({
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
	},
})

-- Mini statusline & pick
require("mini.statusline").setup()
require("mini.pick").setup({
	options = {
		use_cache = true,
	},
})

-- Telescope
require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			".git/",
			"vendor/",
		},

		layout_config = {
			prompt_position = "top",
		},

		sorting_strategy = "ascending",
	},
})

-- Oil.nvim sozlamalari
require("oil").setup({
	default_file_explorer = true,
	columns = { "icon" },
	view_options = { show_hidden = true },
	-- Qolgan barcha oil sozlamalarini shu yerga paste qilishingiz mumkin
})

-- Conform
require("conform").setup({
	formatters_by_ft = {
		sh = { "shfmt" },
		bash = { "shfmt" },
		zsh = { "shfmt" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		rust = { "rustfmt" },
		php = { "pint" },
		blade = { "blade-formatter" },
		html = { "prettier" },
		css = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		go = { "gofumpt" }, -- gofmt dan kuchliroq
		python = { "ruff_format" }, -- black dan tezroq, hamma narsa bir tool
		sql = { "sqlfmt" },
	},
	format_on_save = {
		async = false,
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- Autopairs
require("nvim-autopairs").setup({})
