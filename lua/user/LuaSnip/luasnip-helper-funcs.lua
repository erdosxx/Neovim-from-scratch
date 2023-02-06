local M = {}

local ls = require("luasnip")
local i = ls.insert_node
local sn = ls.snippet_node

function M.get_visual(args, parent)
	-- LS_SELECT_RAW also works
	if #parent.snippet.env.SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
	else
		return sn(nil, i(1))
	end
end

return M
