local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- === Neo-tree Focus Toggle Function ===
local function ToggleNeoTreeFocus()
  local found_neo_tree = false
  local neo_tree_win = nil

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    if ft == "neo-tree" then
      found_neo_tree = true
      neo_tree_win = win
      break
    end
  end

  if found_neo_tree and neo_tree_win then
    if vim.api.nvim_get_current_win() == neo_tree_win then
      vim.cmd("wincmd p")
    else
      vim.api.nvim_set_current_win(neo_tree_win)
    end
  else
    vim.cmd("Neotree show")
  end
end

-- === Save ===
map({ "n", "i", "v" }, "<C-s>", function()
  vim.cmd("w")
end, opts)

-- === Comment toggles ===
map("n", "++", "<Plug>NERDCommenterToggle", opts)
map("v", "++", "<Plug>NERDCommenterToggle", opts)

-- === Buffer Navigation ===
map("n", "H", ":BufferLineCyclePrev<CR>", opts)
map("n", "L", ":BufferLineCycleNext<CR>", opts)
map("n", "b", ":bdelete<CR>", opts)
map("n", "gb", ":BufferLinePick<CR>", opts)

-- === Window Management ===
map("n", "-", "<C-w><", opts)
map("n", "=", "<C-w>>", opts)
map("n", "<Leader>w+", ":vertical resize +5<CR>", opts)
map("n", "<Leader>w-", ":vertical resize -5<CR>", opts)

-- === Clipboard ===
map({ "n", "v" }, "<Leader>y", '"+y', opts)
map({ "n", "v" }, "<Leader>p", '"+p', opts)

-- === Terminal & Insert ===
map("t", "<Esc>", [[<C-\><C-n>]], opts)
map("i", "<C-BS>", "<C-w>", opts)

-- === Tabs & Terminal ===
map("n", "<Leader>t", ":botright terminal<CR>", opts)
map("n", "T", ":bdelete! term<CR>", opts)

-- === Godot Specific Keymaps ===
map("n", "<Leader>gr", ":!godot --path %:p:h<CR>", opts)
map("n", "<Leader>gR", ":!godot --path .<CR>", opts)
map("n", "<Leader>go", ":!godot -e --path %:p:h<CR>", opts)
map("n", "<Leader>gd", ":!godot --path %:p:h --debug<CR>", opts)

-- === CoC Keymaps ===
vim.cmd([[
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)
xmap <Leader>f  <Plug>(coc-format-selected)
nmap <Leader>f  <Plug>(coc-format-selected)
xmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>ac <Plug>(coc-codeaction)
nmap <Leader>qf <Plug>(coc-fix-current)
]])

-- === Prettier Command ===
vim.cmd([[command! -nargs=0 Prettier :CocCommand prettier.formatFile]])

-- === Neo-tree Toggle ===
map("n", "<Leader>n", ToggleNeoTreeFocus, opts)
map("n", "<C-n>", ":Neotree toggle<CR>", opts)

-- === Terminal Management ===
map("n", "<Leader>th", ":lua HideTerminal()<CR>", opts)

-- === Split Window Management ===
map("n", "<Leader>sv", ":vsplit<CR>", opts)
map("n", "<Leader>sh", ":split<CR>", opts)
map("n", "<Leader>se", ":vsplit<CR>", opts)
map("n", "<Leader>sE", ":split<CR>", opts)

-- Navigate between splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize splits
map("n", "<C-Left>", ":vertical resize -5<CR>", opts)
map("n", "<C-Right>", ":vertical resize +5<CR>", opts)
map("n", "<C-Up>", ":resize -5<CR>", opts)
map("n", "<C-Down>", ":resize +5<CR>", opts)

-- Close current split
map("n", "<Leader>sc", "<C-w>c", opts)

-- Maximize current split
map("n", "<Leader>sm", "<C-w>o", opts)

-- === Telescope Keymaps ===
map("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<Leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>", opts)

-- === Notify Test Command ===
vim.cmd([[
command! TestNotify lua vim.notify("This is a test notification!", "info", { title = "Notice.nvim" })
]])
