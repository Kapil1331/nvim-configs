require("paq")({
    "savq/paq-nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",            -- Completion plugin
    "hrsh7th/cmp-nvim-lsp",        -- LSP source for nvim-cmp
    "hrsh7th/cmp-buffer",          -- Buffer source for nvim-cmp
    "hrsh7th/cmp-path",            -- Path source for nvim-cmp
    "L3MON4D3/LuaSnip",            -- Snippet engine
    "saadparwaiz1/cmp_luasnip",    -- Snippet source for nvim-cmp})
})

local lspconfig = require("lspconfig")
local lsps = { "clangd" }

for _, lsp in pairs(lsps) do
    local setup = {}
    lspconfig[lsp].setup(setup)
end

local cmp = require("cmp")

cmp.setup({
    completion = {
        autocomplete = false,
        completeopt = "menu,menuone,noinsert,noselect",
        keyword_length = 2,
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
    formatting = {
        format = function(_, vim_item)
            return vim_item
        end,
    },
})

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { noremap = true, silent = true })

-- --------------------------------------------------------------------------------
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

local function set_keymap(lhs, rhs)
	vim.api.nvim_set_keymap('i', lhs, rhs, { noremap = true, silent = true })
end
set_keymap("(", "()<Left>")
set_keymap("[", "[]<Left>")
set_keymap("<", "<><Left>")
set_keymap("{", "{}<Left>")

vim.cmd("runtime plugin/.cscope_maps.vim")
vim.cmd('colorscheme torte')
-- vim.cmd('colorscheme slate')

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4 
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.cmd("highlight Visual ctermbg=242 guibg=#3e4452 guifg=NONE gui=NONE")
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight CursorLine cterm=none")
vim.cmd("highlight CursorLine guibg=#31363F ctermbg=237")
vim.cmd("highlight CursorLineNr guifg=#FF69B4 ctermfg=201 cterm=none gui=none")
vim.cmd("highlight LineNr guifg=#FF7F7F ctermfg=210")
vim.cmd("hi link markdownError Normal")
vim.cmd("set linebreak")

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.opt.mouse = "a"

vim.keymap.set({'n','v'}, '<C-Up>', '3k', { noremap = true, silent = true })
vim.keymap.set({'n','v'}, '<C-Down>', '3j', { noremap = true, silent = true })
vim.keymap.set('i', '<C-e>', '<Esc>A', { noremap = true, silent = true })
vim.keymap.set('i', '<C-a>', '<Esc>I', { noremap = true, silent = true })
