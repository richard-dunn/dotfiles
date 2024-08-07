return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitfilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>gs", "<cmd>LazyGit<CR>", desc = "LazyGit" },
	},
	-- setup = function()
	-- 	-- Define custom key mappings for Lazygit
	-- 	vim.api.nvim_set_keymap("n", "m", "h", { noremap = true, buffer = true })
	-- 	vim.api.nvim_set_keymap("n", "=", "m", { noremap = true, buffer = true })
	-- 	vim.api.nvim_set_keymap("n", "n", "j", { noremap = true, buffer = true })
	-- 	vim.api.nvim_set_keymap("n", "e", "k", { noremap = true, buffer = true })
	-- 	vim.api.nvim_set_keymap("n", "E", "e", { noremap = true, buffer = true })
	-- 	vim.api.nvim_set_keymap("n", "i", "l", { noremap = true, buffer = true })
	-- 	vim.api.nvim_set_keymap("n", "x", "i", { noremap = true, buffer = true })
	-- end,
}
