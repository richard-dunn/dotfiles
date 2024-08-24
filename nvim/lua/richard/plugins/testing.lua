return {
	"vim-test/vim-test",
	keys = {
		{ "<leader>tt", "<cmd>TestNearest<CR>" },
		{ "<leader>tf", "<cmd>TestFile<CR>" },
		{ "<leader>ts", "<cmd>TestSuite<CR>" },
		{ "<leader>tl", "<cmd>TestLast<CR>" },
		{ "<leader>tv", "<cmd>TestVisit<CR>" },
	},
}
-- return {
-- 	"nvim-neotest/neotest",
-- 	dependencies = {
-- 		"nvim-neotest/nvim-nio",
-- 		"nvim-lua/plenary.nvim",
-- 		"antoinemadec/FixCursorHold.nvim",
-- 		"nvim-treesitter/nvim-treesitter",
-- 		"zidhuss/neotest-minitest",
-- 	},
-- 	config = function()
-- 		require("neotest").setup({
-- 			adapters = {
-- 				require("neotest-minitest")({
-- 					test_cmd = function()
-- 						return vim.tbl_flatten({
-- 							"bundle",
-- 							"exec",
-- 							"rails",
-- 							"test",
-- 						})
-- 					end,
-- 				}),
-- 			},
-- 		})
-- 	end,
-- 	keys = {
-- 		{
-- 			"<leader>tt",
-- 			function()
-- 				require("neotest").run.run()
-- 			end,
-- 		},
-- 		{
-- 			"<leader>tf",
-- 			function()
-- 				require("neotest").run.run(vim.fn.expand("%"))
-- 			end,
-- 		},
-- 		{
-- 			"<leader>th",
-- 			function()
-- 				require("neotest").run.stop()
-- 			end,
-- 		},
-- 		{
-- 			"<leader>ti",
-- 			function()
-- 				require("neotest").summary.toggle()
-- 			end,
-- 		},
-- 		{
-- 			"<leader>to",
-- 			function()
-- 				require("neotest").output.open()
-- 			end,
-- 		},
-- 		{
-- 			"<leader>tO",
-- 			function()
-- 				require("neotest").output.open({ enter = true })
-- 			end,
-- 		},
-- 		{
-- 			"<leader>tn",
-- 			function()
-- 				require("neotest").jump.next({ status = "failed" })
-- 			end,
-- 		},
-- 		{
-- 			"<leader>te",
-- 			function()
-- 				require("neotest").jump.prev({ status = "failed" })
-- 			end,
-- 		},
-- 	},
-- }
