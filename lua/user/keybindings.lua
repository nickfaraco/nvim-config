local nnoremap = require("user.keymap").nnoremap
local inoremap = require("user.keymap").inoremap
local vnoremap = require("user.keymap").vnoremap
local xnoremap = require("user.keymap").xnoremap
local tnoremap = require("user.keymap").tnoremap

nnoremap("<leader>fe", "<cmd>Ex<CR>")

-- NORMAL MODE
-- Better window navigation
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')
nnoremap('<C-Left>', '<C-w>h')
nnoremap('<C-Down>', '<C-w>j')
nnoremap('<C-Up>', '<C-w>k')
nnoremap('<C-Right>', '<C-w>l')

-- TODO change with vimtree
nnoremap('<leader>e', ':NvimTreeToggle<CR>')

-- Resize windows 
nnoremap('<A-h>', ':vertical resize -2<CR>')
nnoremap('<A-j>', ':resize -2<CR>')
nnoremap('<A-k>', ':resize +2<CR>')
nnoremap('<A-l>', ':vertical resize +2<CR>')
nnoremap('<A-Left>', ':vertical resize -2<CR>')
nnoremap('<A-Down>', ':resize -2<CR>')
nnoremap('<A-Up>', ':resize +2<CR>')
nnoremap('<A-Right>', ':vertical resize +2<CR>')

-- Navigate buffers
nnoremap("<leader>l", ":bnext<CR>")
nnoremap("<leader>h", ":bprevious<CR>")
nnoremap("<leader>x", ":bdelete<CR>")

-- INSERT MODE
-- Press jk fast to Escape
inoremap('jk', '<ESC>')

-- VISUAL MODE
-- Stay in indent mode
vnoremap("<", "<gv")
vnoremap(">", ">gv", opts)

-- Move text up and down
vnoremap("<A-j>", ":m .+1<CR>==")
vnoremap("<A-k>", ":m .-2<CR>==")

-- Do not overwrite register when pasting in visual mode
vnoremap("p", '"_dP')

-- VISUAL BLOCK
-- Move text up and down
xnoremap("J", ":move '>+1<CR>gv-gv")
xnoremap("K", ":move '<-2<CR>gv-gv")
xnoremap("<A-j>", ":move '>+1<CR>gv-gv")
xnoremap("<A-k>", ":move '<-2<CR>gv-gv")

-- TERMINAL
-- Better terminal navigation
tnoremap("<C-h>", "<C-\\><C-N><C-w>h", term_opts)
tnoremap("<C-j>", "<C-\\><C-N><C-w>j", term_opts)
tnoremap("<C-k>", "<C-\\><C-N><C-w>k", term_opts)
tnoremap("<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- CUSTOM PLUGINS
-- Comment
nnoremap('<leader>c', 'gcc')
vnoremap('<leader>c', 'gc')

-- Telescope
nnoremap('<leader>ff', ':Telescope find_files<CR>')
