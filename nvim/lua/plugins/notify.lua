return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "#000000", -- 6 ta nol bo‘lishi shart
			stages = "fade_in_slide_out",
			timeout = 3000,
		})
		vim.notify = require("notify")
	end,
}
