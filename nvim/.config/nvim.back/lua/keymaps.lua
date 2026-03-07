local opts = { noremap = true, silent = true }
local key = vim.keymap

-- Umumiy
key.set('n', '<leader>o', ':update<CR> :source<CR>')
key.set("i", "<C-s>", "<Esc>:w<CR>", opts)
key.set("n", "<C-s>", ":w<CR>", opts)
key.set("n", "<C-q>", "<cmd> q <CR>", opts)
key.set("n", "<leader>lf", vim.lsp.buf.format)

-- Plaginlar uchun (Pick, Oil)
key.set("n", "<leader>f", ":Pick files<CR>")
key.set("n", "<leader>H", ":Pick help<CR>")
key.set("n", "-", ":Oil<CR>")

-- Clipboard
key.set({"n", "v", "x"}, "<leader>y", '"+y<CR>')
key.set({"n", "v", "x"}, "<leader>d", '"+d<CR>')

-- Window management
key.set("n", "<leader>v", "<C-w>v", opts)
key.set("n", "<leader>h", "<C-w>s", opts)
key.set("n", "<leader>se", "<C-w>=", opts)
key.set("n", "<leader>xs", ":close<CR>", opts)

-- Navigate between splits
key.set("n", "<C-k>", ":wincmd k<CR>", opts)
key.set("n", "<C-j>", ":wincmd j<CR>", opts)
key.set("n", "<C-h>", ":wincmd h<CR>", opts)
key.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Resize with arrows
key.set("n", "<Up>", ":resize -2<CR>", opts)
key.set("n", "<Down>", ":resize +2<CR>", opts)
key.set("n", "<Left>", ":vertical resize +2<CR>", opts)
key.set("n", "<Right>", ":vertical resize -2<CR>", opts)

-- Tabs
key.set("n", "<A-S-t>", ":tabnew<CR>", opts)
key.set("n", "<Tab>", ":tabn<CR>", opts)
key.set("n", "<S-Tab>", ":tabp<CR>", opts)
key.set("n", "<A-S-w>", ":tabclose<CR>", opts)
