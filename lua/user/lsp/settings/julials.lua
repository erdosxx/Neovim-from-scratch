-- To use this at the first time, run following command
-- julia --project=~/.julia/environments/nvim-lspconfig
-- -e 'using Pkg; Pkg.add("LanguageServer")'
-- Ref: https://discourse.julialang.org/t/neovim-languageserver-jl/37286/63?page=5
return {
	on_new_config = function(new_config, _)
		local julia =
			vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
		if require("lspconfig").util.path.is_file(julia) then
			-- This replace just the command (first element of the array)
			-- with the custom Julia path(nvim-lspconfig),
			-- while preserving any arguments that
			-- might be defined in the default configuration.
			new_config.cmd[1] = julia
		end
	end,
}
