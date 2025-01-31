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
vim.opt.number = true
vim.cmd("runtime plugin/.cscope_maps.vim")
vim.opt.relativenumber = true
vim.cmd('colorscheme torte')
vim.opt.tabstop = 6
vim.opt.shiftwidth = 6
vim.opt.softtabstop = 6 
--vim.opt.expandtab = true
