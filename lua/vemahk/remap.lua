local map = vim.keymap.set
map("n", "<leader>bd", function ()
	vim.cmd [[bd]];
	vim.cmd.Ex();
end)

map("n", "<leader>wo", vim.cmd.only);
map("n", "<leader>wc", "<C-W>c");

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

local opts = { noremap = true, silent = true }

map("i", "<S-Del>", "<C-O>dw", opts);
map("i", "<C-H>", "<C-O>db", opts);
map("i", "<S-BS>", "<C-O>db", opts);


-- Move to previous/next
map('n', '<M-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<M-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<M-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<M->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Pin/unpin buffer
map('n', '<M-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<M-c>', function ()
	vim.cmd [[BufferClose]]
	vim.cmd.Ex()
end, opts)

map('i', '<C-y>', 'copilot#Accept("")', {
    expr = true,
    replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

