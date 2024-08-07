-- Set filetype for Guardfile
vim.cmd([[
  augroup guardfile
    autocmd!
    autocmd BufRead,BufNewFile Guardfile set filetype=ruby
  augroup END
]])

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			ensure_installed = {
				"bash",
				"css",
				"csv",
				"dockerfile",
				"gitignore",
				"html",
				"javascript",
				"json",
				"liquid",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"ruby",
				"scss",
				"sql",
				"ssh_config",
				"tmux",
				"vim",
				"xml",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<BS>",
				},
			},
		})
	end,
}
-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	-- event = { "BufReadPre", "BufNewFile" },
-- 	build = ":TSUpdate",
-- 	dependencies = {
-- 		"windwp/nvim-ts-autotag",
-- 	},
-- 	config = function()
-- 		local treesitter = require("nvim-treesitter.configs")
--
-- 		treesitter.setup({
-- 			highlight = { enable = true },
-- 			indent = { enable = true },
-- 			autotag = { enable = true },
-- 			ensure_installed = {
-- 				"bash",
-- 				"css",
-- 				"csv",
-- 				"dockerfile",
-- 				"gitignore",
-- 				"html",
-- 				"javascript",
-- 				"json",
-- 				"liquid",
-- 				"lua",
-- 				"markdown",
-- 				"markdown_inline",
-- 				"python",
-- 				"ruby",
-- 				"scss",
-- 				"sql",
-- 				"ssh_config",
-- 				"tmux",
-- 				"vim",
-- 				"xml",
-- 				"yaml",
-- 			},
-- 			incremental_selection = {
-- 				enable = true,
-- 				keymaps = {
-- 					init_selection = "<C-space>",
-- 					node_incremental = "<C-space>",
-- 					scope_incremental = false,
-- 					node_decremental = "<BS>",
-- 				},
-- 			},
-- 		})
-- 	end,
-- }
