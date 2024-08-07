require("richard.core")
require("richard.lazy")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "ruby",
	callback = function()
		local current_path = vim.opt_local.path:get()
		table.insert(current_path, "~/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib")
		vim.opt_local.path = current_path
	end,
})
