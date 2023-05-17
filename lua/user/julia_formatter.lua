-- For more options:
-- https://domluna.github.io/JuliaFormatter.jl/stable/api/#JuliaFormatter.format_file-Tuple%7BAbstractString%7D

vim.g.JuliaFormatter_options = {
	indent = 2,
	margin = 79,
	always_for_in = false,
	whitespace_typedefs = true,
	whitespace_ops_in_indices = true,
	remove_extra_newlines = true,
}

vim.g.JuliaFormatter_always_launch_server = 1
