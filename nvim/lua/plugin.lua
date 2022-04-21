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
   use {
   'kyazdani42/nvim-tree.lua',
   config = function() require'nvim-tree'.setup {} end
   }
   use 'tpope/vim-commentary'
   use 'windwp/nvim-autopairs'
   use {
     'nvim-lualine/lualine.nvim',
     requires = { 'kyazdani42/nvim-web-devicons', opt = true },
   }
   use 'voldikss/vim-floaterm'
   use 'junegunn/vim-easy-align'
   use 'nvim-treesitter/nvim-treesitter'
   use {'neoclide/coc.nvim', branch = 'release'}

end)

vim.opt.termguicolors = true
require("bufferline").setup{}

-- Default value is clap so change to telescope
vim.g.dashboard_default_executive ='telescope'

-- Blankline
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.g.indent_blankline_filetype = {''}

-- Nvim tree
require('nvim-tree').setup()

keymap('n', '<leader>v', ':NvimTreeToggle<cr>')

-- vim Floaterm
keymap('t', '<leader>t', '<C-\\><C-n>:FloatermToggle<cr>')
keymap('n', '<leader>t', ':FloatermToggle<cr>')

-- Color scheme
vim.cmd[[colorscheme tokyonight]]

-- Change buffer
keymap('i', '<leader><Tab>', '<Esc>:BufferLineCycleNext<cr>')
keymap('n', '<leader><Tab>', ':BufferLineCycleNext<cr>')
-- Close buffer
keymap('n', '<leader>`', ':BufferLinePickClose<cr>')
keymap('n', '<leader>~', ':BufferLineCloseRight<cr>')

-- Telescope
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')

-- Autopairs
require('nvim-autopairs').setup{}

-- Lualine
require('lualine').setup{}

-- Dash board
vim.cmd [[

nnoremap <silent> <leader>fh :DashboardFindHistory<cr>

let g:dashboard_custom_header = [
    \'',
    \'⣿⣿⣿⣿⣯⣿⣿⠄⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠈⣿⣿⣿⣿⣿⣿⣆⠄',
    \'⢻⣿⣿⣿⣾⣿⢿⣢⣞⣿⣿⣿⣿⣷⣶⣿⣯⣟⣿⢿⡇⢃⢻⣿⣿⣿⣿⣿⢿⡄',
    \'⠄⢿⣿⣯⣏⣿⣿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣧⣾⢿⣮⣿⣿⣿⣿⣾⣷',
    \'⠄⣈⣽⢾⣿⣿⣿⣟⣄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣝⣯⢿⣿⣿⣿⣿',
    \'⣿⠟⣫⢸⣿⢿⣿⣾⣿⢿⣿⣿⢻⣿⣿⣿⢿⣿⣿⣿⢸⣿⣼⣿⣿⣿⣿⣿⣿⣿',
    \'⡟⢸⣟⢸⣿⠸⣷⣝⢻⠘⣿⣿⢸⢿⣿⣿⠄⣿⣿⣿⡆⢿⣿⣼⣿⣿⣿⣿⢹⣿',
    \'⡇⣿⡿⣿⣿⢟⠛⠛⠿⡢⢻⣿⣾⣞⣿⡏⠖⢸⣿⢣⣷⡸⣇⣿⣿⣿⢼⡿⣿⣿',
    \'⣡⢿⡷⣿⣿⣾⣿⣷⣶⣮⣄⣿⣏⣸⣻⣃⠭⠄⠛⠙⠛⠳⠋⣿⣿⣇⠙⣿⢸⣿',
    \'⠫⣿⣧⣿⣿⣿⣿⣿⣿⣿⣿⣿⠻⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣹⢷⣿⡼⠋',
    \'⠄⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣿⠄⠄',
    \'⠄⠄⢻⢹⣿⠸⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣼⣿⣿⣿⣿⡟⠄⠄',
    \'⠄⠄⠈⢸⣿⠄⠙⢿⣿⣿⣹⣿⣿⣿⣿⣟⡃⣽⣿⣿⡟⠁⣿⣿⢻⣿⣿⢿⠄⠄',
    \'⠄⠄⠄⠘⣿⡄⠄⠄⠙⢿⣿⣿⣾⣿⣷⣿⣿⣿⠟⠁⠄⠄⣿⣿⣾⣿⡟⣿⠄⠄',
    \'⠄⠄⠄⠄⢻⡇⠸⣆⠄⠄⠈⠻⣿⡿⠿⠛⠉⠄⠄⠄⠄⢸⣿⣇⣿⣿⢿⣿⠄⠄',
    \'',
    \]

let g:dashboard_custom_footer = [
\   'Even is in a Dungeon you still need to relax'
\]
]]

-- vim-easy-align
vim.cmd [[
" ga*= for you who forgot about how this work
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
]]

-- tree sitter
local configs = require'nvim-treesitter.configs'
configs.setup {
    ensure_installed = "maintained", -- Only use parsers that are maintained
    highlight = { -- enable highlighting
      enable = true, 
    },
    indent = {
      enable = false, -- default is disabled anyways
    }
}
