-- Paketlarni yuklash
vim.pack.add({
	{ src = "https://github.com/bluz71/vim-moonfly-colors", name = "moonfly" },
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/rcarriga/nvim-notify" },
	{ src = "https://github.com/nvim-mini/mini.statusline" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
})

-- Color theme
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
require("mini.pick").setup()

-- Oil.nvim sozlamalari
require("oil").setup({
	default_file_explorer = true,
	columns = { "icon" },
	view_options = { show_hidden = true },
	-- Qolgan barcha oil sozlamalarini shu yerga paste qilishingiz mumkin
})
