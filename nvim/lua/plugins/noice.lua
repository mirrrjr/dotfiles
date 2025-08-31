return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
		routes = {
			{
				-- Fayl saqlanganda chiqadigan "written" xabarini yashirish
				filter = {
					event = "msg_show",
					kind = "",
					find = "written",
				},
				opts = { skip = true },
			},
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
}
