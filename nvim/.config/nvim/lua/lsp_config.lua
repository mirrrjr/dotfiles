vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end,
})

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = { enable = false },
			},
		},
	},
	ts_ls = {},
	intelephense = {
		settings = {
			intelephense = {
				files = { maxSize = 5000000 },
			},
		},
	},
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = { command = "clippy" },
				cargo = { allFeatures = true },
			},
		},
	},
	html = {},
	cssls = {},
	tailwindcss = {
		filetypes = { "html", "css", "javascriptreact", "typescriptreact", "blade", "php" },
	},
	jsonls = {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	},
	marksman = {},
	dockerls = {},
	yamlls = {
		settings = {
			yaml = { schemaStore = { enable = true } },
		},
	},
	sqls = {
		settings = {
			sqls = {
				connections = {
					{
						driver = "mysql",
						dataSourceName = "user:pass@tcp(127.0.0.1:3306)/dbname",
					},
				},
			},
		},
	},
	gopls = {
		settings = {
			gopls = {
				gofumpt = true,
				staticcheck = true,
			},
		},
	},
}

for name, config in pairs(servers) do
	vim.lsp.config(name, config)
end

local server_names = {}
for name, _ in pairs(servers) do
	table.insert(server_names, name)
end
vim.lsp.enable(server_names)

vim.opt.completeopt = { "menu", "menuone", "noselect" }
