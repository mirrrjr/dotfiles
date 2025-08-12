-- For conciseness
local opts = { noremap = true, silent = true }

-- Float Oil window
vim.keymap.set("n", "\\", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory In Oil" })

-- Save file
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- Format file
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format current file" })

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
-- vim.keymap.set("n", "x", '"_x', opts)
-- vim.keymap.set("n", "d", '"_d', opts)
-- vim.keymap.set("v", "d", '"_d', opts)

-- Change next match
vim.keymap.set("n", "<leader>r", "*cgn", { desc = "Change next match of word under cursor" })

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })

-- Tabs (custom keys)
vim.keymap.set("n", "<A-S-t>", ":tabnew<CR>", opts) -- Alt+Shift+T → new tab
vim.keymap.set("n", "<Tab>", ":tabn<CR>", opts) -- Tab → next tab
vim.keymap.set("n", "<S-Tab>", ":tabp<CR>", opts) -- Shift+Tab → previous tab
vim.keymap.set("n", "<A-S-w>", ":tabclose<CR>", opts) -- Alt+Shift+W → close tab

-- NvimTree Toggle
vim.keymap.set("n", "<leader>e", function()
	local api = require("nvim-tree.api")
	api.tree.toggle()
end, { desc = "Toggle NvimTree", noremap = true, silent = true })

-- NvimTree Focus
vim.keymap.set("n", "<leader>l", function()
	local api = require("nvim-tree.api")
	api.tree.focus()
end, { desc = "Focus NvimTree", noremap = true, silent = true })
