-- For more options:
-- https://domluna.github.io/JuliaFormatter.jl/stable/

vim.g.JuliaFormatter_options = {
	style = "sciml",
	indent = 2, -- default is 4
	margin = 79, -- deafult is 92
	--[[ always_for_in = false,  -- true for YAS ]]
	--[[ whitespace_typedefs = true, -- false for YAS ]]
	--[[ whitespace_ops_in_indices = true,  -- default for YAS ]]
	--[[ remove_extra_newlines = true,  -- default for YAS ]]
}

vim.g.JuliaFormatter_always_launch_server = 1
