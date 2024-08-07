require("richard.core.options")

local function read_keyboard_layout()
	local file = io.open(os.getenv("HOME") .. "/.keyboard_layout", "r")

	if file then
		local layout = file:read("*a")
		file:close()
		return layout:match("^%s*(.-)%s*$")
	else
		return "qwerty"
	end
end

local layout = read_keyboard_layout()
if layout == "colemak" then
	require("richard.core.colemak_keymaps")
else
	require("richard.core.qwerty_keymaps")
end

require("richard.core.shared_keymaps")
