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

-- moving around
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- search
keymap.set("n", "h", "nzzzv")
keymap.set("n", "H", "Hzzzv")
keymap.set("n", "<leader>nh", ":nohlsearch<CR>")
keymap.set("n", "gtt", "/test <CR>zz", { desc = "Goto: Next test" })
keymap.set("n", "gpt", "?test <CR>zz", { desc = "Goto: Prev test" })
keymap.set("n", "gts", "/skip<CR>zz", { desc = "Goto: Next skipped test" })

keymap.set("n", "<leader>ee", ":Explore<CR>")

-- moving code
keymap.set("v", "N", ":m '>+1<cr>gv=gv")
keymap.set("v", "E", ":m '<-2<CR>gv=gv")
keymap.set("n", "N", "mzJ`z")
keymap.set("n", "yd", "ggVGy<C-o>")

-- tmux
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- saving and quitting
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
keymap.set("n", "<leader>qw", ":q<CR>", { desc = "Quit window" })
keymap.set("n", "<leader>qq", ":qa<CR>", { desc = "Quit all" })
keymap.set("n", "<leader>qf", ":q!<CR>", { desc = "Force quit" })

-- git
keymap.set(
	"n",
	"<leader>gh",
	':!open "https://github.com/cameronevents/$(basename "$(git rev-parse --show-toplevel)")"<CR>',
	{ desc = "Open repo in GitHub" }
)

-- format whole file
keymap.set("n", "<leader>%", ":%norm==<CR>")
