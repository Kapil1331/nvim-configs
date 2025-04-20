require("paq")({
    "savq/paq-nvim"
})
vim.wo.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.clipboard:append('unnamedplus')
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.scrolloff = 15

vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_set_keymap(
  'i',                     
  '{',                     
  '{<CR>}<Esc>ko',        
  { noremap = true, silent = true } 
)
local function set_keymap(lhs, rhs)
	vim.api.nvim_set_keymap('i', lhs, rhs, { noremap = true, silent = true })
end
set_keymap("'", "''<Left>")
set_keymap('"', '""<Left>')
set_keymap("(", "()<Left>")
set_keymap("[", "[]<Left>")
set_keymap("{", "{<CR>}<Esc>ko")
set_keymap("<", "<><Left>")

vim.cmd("runtime plugin/.cscope_maps.vim")
vim.cmd('colorscheme torte')

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4 
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.cmd("highlight CursorLine cterm=none")
vim.cmd("highlight CursorLine guibg=#31363F ctermbg=237")

vim.cmd("highlight CursorLineNr guifg=#FF69B4 ctermfg=201 cterm=none gui=none")
vim.cmd("highlight LineNr guifg=#FF7F7F ctermfg=210")

vim.cmd("hi link markdownError Normal")

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.opt.mouse = "a"
