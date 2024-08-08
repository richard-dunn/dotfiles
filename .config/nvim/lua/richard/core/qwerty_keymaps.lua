vim.g.mapleader = " "
local keymap = vim.keymap

-- moving code
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '>-2<CR>gv=gv")
keymap.set("n", "J", "mzJ`z")
