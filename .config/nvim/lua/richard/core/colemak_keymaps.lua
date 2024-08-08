vim.g.mapleader = " "
local keymap = vim.keymap

-- colemak dh remaps
keymap.set("n", "m", "h")
keymap.set("n", "n", "j")
keymap.set("n", "e", "k")
keymap.set("n", "i", "l")
keymap.set("n", "M", "H")
keymap.set("n", "N", "J")
keymap.set("n", "E", "K")
keymap.set("n", "I", "L")
keymap.set("n", "j", "e")
keymap.set("n", "l", "i")
keymap.set("n", "h", "n")
keymap.set("n", "J", "E")
keymap.set("n", "L", "I")
keymap.set("n", "H", "N")
keymap.set("n", "k", "m")
keymap.set("n", "<C-l>", "<C-i>", { noremap = true })

-- Colemak remaps for visual mode
keymap.set("v", "m", "h")
keymap.set("v", "n", "j")
keymap.set("v", "e", "k")
keymap.set("v", "i", "l")
keymap.set("v", "M", "H")
keymap.set("v", "N", "J")
keymap.set("v", "E", "K")
keymap.set("v", "I", "L")
keymap.set("v", "l", "i")

-- Search
keymap.set("n", "h", "nzzzv")
keymap.set("n", "H", "Hzzzv")

-- Moving code
keymap.set("v", "N", ":m '>+1<cr>gv=gv")
keymap.set("v", "E", ":m '<-2<CR>gv=gv")
keymap.set("n", "N", "mzJ`z")
