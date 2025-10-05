-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- ================================
-- == REALITE STUDIO NVIM KEYMAPS ==
-- ================================

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- === Leader Key ===
vim.g.mapleader = ","

-- === Save ===
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<Esc>:w<CR>a', opts)
map('v', '<C-s>', '<Esc>:w<CR>gv', opts)

-- === Comment toggles ===
map('v', '++', '<plug>NERDCommenterToggle', {})
map('n', '++', '<plug>NERDCommenterToggle', {})

-- === Buffer Navigation ===
map('n', 'H', ':BufferLineCyclePrev<CR>', opts)
map('n', 'L', ':BufferLineCycleNext<CR>', opts)
map('n', 'b', ':bdelete<CR>', opts)
map('n', 'gb', ':BufferLinePick<CR>', opts)

-- === Window Management ===
map('n', '-', '<C-w><', opts)
map('n', '=', '<C-w>>', opts)
map('n', '<Leader>w+', ':vertical resize +5<CR>', opts)
map('n', '<Leader>w-', ':vertical resize -5<CR>', opts)

-- === Clipboard ===
map('n', '<Leader>y', '"+y', opts)
map('n', '<Leader>p', '"+p', opts)
map('v', '<Leader>y', '"+y', opts)
map('v', '<Leader>p', '"+p', opts)

-- === Terminal & Insert ===
map('t', '<Esc>', [[<C-\><C-n>]], opts)
map('i', '<C-BS>', '<C-w>', opts)

-- === Tabs & Terminal ===
map('n', '<Leader>t', ':botright terminal<CR>', opts)
map('n', 'T', ':bdelete! term<CR>', opts)

-- === Godot Specific Keymaps ===
map('n', '<leader>gr', ':!godot --path %:p:h<CR>', opts)
map('n', '<leader>gR', ':!godot --path .<CR>', opts)
map('n', '<leader>go', ':!godot -e --path %:p:h<CR>', opts)
map('n', '<leader>gd', ':!godot --path %:p:h --debug<CR>', opts)

-- GDScript specific: set shiftwidth/tabstop for gdscript in autocmds file, not here

-- === CoC Keymaps ===
vim.cmd([[
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)
]])

-- === Prettier Command ===
vim.cmd([[command! -nargs=0 Prettier :CocCommand prettier.formatFile]])

-- === Neo-tree Focus Toggle ===
map('n', '<Leader>n', ':lua ToggleNeoTreeFocus()<CR>', opts)
map('n', '<C-n>', ':Neotree toggle<CR>', opts)

-- === Terminal Management ===
map('n', '<Leader>th', ':lua HideTerminal()<CR>', opts)

-- === Split Window Management ===
map('n', '<leader>sv', ':vsplit<CR>', opts)
map('n', '<leader>sh', ':split<CR>', opts)
map('n', '<leader>se', ':vsplit<CR>', opts)
map('n', '<leader>sE', ':split<CR>', opts)

-- Navigate between splits
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize splits
map('n', '<C-Left>', ':vertical resize -5<CR>', opts)
map('n', '<C-Right>', ':vertical resize +5<CR>', opts)
map('n', '<C-Up>', ':resize -5<CR>', opts)
map('n', '<C-Down>', ':resize +5<CR>', opts)

-- Close current split
map('n', '<leader>sc', '<C-w>c', opts)

-- Maximize current split
map('n', '<leader>sm', '<C-w>o', opts)

-- === Telescope Keymaps ===
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)

-- === Notify Test Command ===
vim.cmd([[command! TestNotify lua vim.notify("This is a test notification!", "info", { title = "Notice.nvim" })]])