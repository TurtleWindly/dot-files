local function keymap(mode, keys, mapping)
    vim.api.nvim_set_keymap(mode, keys, mapping, { noremap = true })
end

-- Keymapping
vim.g.mapleader = ';'
vim.g.mapLocalleader = ';'

keymap('i', 'jj', '<Esc>')

-- Save file
keymap('n', '<leader>w', ':wq<cr>')

-- Windows travel
keymap('n', '<leader>h', '<C-w>h')
keymap('n', '<leader>j', '<C-w>j')
keymap('n', '<leader>k', '<C-w>k')
keymap('n', '<leader>l', '<C-w>l')
-- Close
keymap('n', '<leader>q', ':q<cr>')
