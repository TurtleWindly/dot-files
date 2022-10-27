local function keymap(mode, keys, mapping)
   vim.api.nvim_set_keymap(mode, keys, mapping, { noremap = true })
end

require('packer').startup(function()
   use 'wbthomason/packer.nvim'
   use 'folke/tokyonight.nvim'
   use {
   'nvim-telescope/telescope.nvim',
   requires = { {'nvim-lua/plenary.nvim'} }
   }
   use 'glepnir/dashboard-nvim'
   use {
       'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons',
   }
   use "lukas-reineke/indent-blankline.nvim"
   use 'tpope/vim-commentary'
   use 'windwp/nvim-autopairs'
   use {
     'nvim-lualine/lualine.nvim',
     requires = { 'kyazdani42/nvim-web-devicons', opt = true },
   }
   use 'voldikss/vim-floaterm'
   use 'junegunn/vim-easy-align'
   use {'neoclide/coc.nvim', branch = 'release'}

end)

-- Color scheme
vim.cmd[[colorscheme tokyonight]]

vim.opt.termguicolors = true

-- Blankline
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.g.indent_blankline_filetype = {'dashboard'}

-- vim Floaterm
keymap('t', '<leader>t', '<C-\\><C-n>:FloatermToggle<cr>')
keymap('n', '<leader>t', ':FloatermToggle<cr>')

-- Change buffer
require("bufferline").setup{}
keymap('i', '<leader><Tab>', '<Esc>:BufferLineCycleNext<cr>')
keymap('n', '<leader><Tab>', ':BufferLineCycleNext<cr>')
-- Close buffer
keymap('n', '<leader>`', ':BufferLinePickClose<cr>')
keymap('n', '<leader>~', ':BufferLineCloseRight<cr>')

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files<cr>')
keymap('n', '<leader>fg', ':Telescope git_status<cr>')

require('telescope').setup{  defaults = { file_ignore_patterns = { 
   "target",
   "public",
   "Cargo.lock",
   ".png",
   ".jpg",
   ".svg",
   ".ogg",
   ".wav",
   ".mp3"
}} }

-- Autopairs
require('nvim-autopairs').setup{}

-- Lualine
require('lualine').setup{}

-- vim-easy-align
vim.cmd [[
" ga*= for you who forgot about how this work
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
]]
