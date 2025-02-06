-- set syntax highlight for http files
vim.cmd('autocmd BufNewFile,BufRead *.http set filetype=http')
vim.cmd('autocmd FileType http TSEnable highlight')

vim.g.mapleader = ' '         -- Set <leader> to SPACE

vim.opt.termguicolors = true  -- 🌟 cOlOurS 🌟
vim.opt.number = true         -- Add line numbers
vim.opt.relativenumber = true -- Add relative line numbers
vim.opt.ignorecase = true     -- Ingnore case during search
vim.opt.smartcase = true      -- ignore uppercase letters unless the search term has an uppercase letter
vim.opt.hlsearch = false      -- turn off highlighting previous search
vim.opt.wrap = false          -- turn off word wrapping
vim.opt.shiftwidth = 2        -- how much to indent when using `<<` or `>>`
vim.opt.expandtab = true      -- don't turn tabs into spaces
vim.opt.tabstop = 2           -- Amount of chars <TAB> takes up
vim.opt.autoindent = true     -- Auto indenting
