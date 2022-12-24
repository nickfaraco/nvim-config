local nnmap = require("user.keymap").nnmap
local inmap = require("user.keymap").inmap
local vnmap = require("user.keymap").vnmap
local xnmap = require("user.keymap").xnmap
local tnmap = require("user.keymap").tnmap

nnmap("<leader>fe", "<cmd>Ex<CR>")

-- Remap for dealing with word wrap
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
nnmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
nnmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- NORMAL MODE
-- Better window navigation
nnmap('<C-h>', '<C-w>h')
nnmap('<C-j>', '<C-w>j')
nnmap('<C-k>', '<C-w>k')
nnmap('<C-l>', '<C-w>l')
nnmap('<C-Left>', '<C-w>h')
nnmap('<C-Down>', '<C-w>j')
nnmap('<C-Up>', '<C-w>k')
nnmap('<C-Right>', '<C-w>l')

-- File explr toggle
nnmap('<leader>e', ':NvimTreeToggle<CR>')

-- Resize windows 
nnmap('<A-h>', ':vertical resize -2<CR>')
nnmap('<A-j>', ':resize -2<CR>')
nnmap('<A-k>', ':resize +2<CR>')
nnmap('<A-l>', ':vertical resize +2<CR>')
nnmap('<A-Left>', ':vertical resize -2<CR>')
nnmap('<A-Down>', ':resize -2<CR>')
nnmap('<A-Up>', ':resize +2<CR>')
nnmap('<A-Right>', ':vertical resize +2<CR>')

-- Navigate buffers
nnmap("<leader>l", ":bnext<CR>")
nnmap("<leader>h", ":bprevious<CR>")
nnmap("<leader>x", ":bdelete<CR>")

-- INSERT MODE
-- Press jk fast to Escape
inmap('jk', '<ESC>')

-- VISUAL MODE
-- Stay in indent mode
vnmap("<", "<gv")
vnmap(">", ">gv", opts)

-- Move text up and down
vnmap("<A-j>", ":m .+1<CR>==")
vnmap("<A-k>", ":m .-2<CR>==")

-- Do not overwrite register when pasting in visual mode
vnmap("p", '"_dP')

-- VISUAL BLOCK
-- Move text up and down
xnmap("J", ":move '>+1<CR>gv-gv")
xnmap("K", ":move '<-2<CR>gv-gv")
xnmap("<A-j>", ":move '>+1<CR>gv-gv")
xnmap("<A-k>", ":move '<-2<CR>gv-gv")

-- TERMINAL
-- Better terminal navigation
tnmap("<C-h>", "<C-\\><C-N><C-w>h", term_opts)
tnmap("<C-j>", "<C-\\><C-N><C-w>j", term_opts)
tnmap("<C-k>", "<C-\\><C-N><C-w>k", term_opts)
tnmap("<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- CUSTOM PLUGINS
-- Comment
nnmap('<leader>c', 'gcc')
vnmap('<leader>c', 'gc')

-- Telescope
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
