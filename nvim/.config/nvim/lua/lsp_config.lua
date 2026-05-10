vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end,
})

local servers = {
    lua_ls = {}, ts_ls = {}, intelephense = {}, rust_analyzer = {},
    html = {}, cssls = {}, tailwindcss = {}, jsonls = {}, 
    marksman = {}, dockerls = {}, yamlls = {}, sqls = {}, gopls = {}
}

for name, config in pairs(servers) do
    vim.lsp.config(name, config)
end

local server_names = {}
for name, _ in pairs(servers) do table.insert(server_names, name) end
vim.lsp.enable(server_names)

vim.opt.completeopt = { "menu", "menuone", "noselect" }
