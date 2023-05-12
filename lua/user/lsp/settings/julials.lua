-- To use this at the first time, run following command
-- julia --project=~/.julia/environments/nvim-lspconfig
-- -e 'using Pkg; Pkg.add("LanguageServer")'
-- Ref: https://discourse.julialang.org/t/neovim-languageserver-jl/37286/63?page=5
return {
	on_new_config = function(new_config, _)
		local julia =
			vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
		--[[ vim.notify("Before Hello") ]]
		if require("lspconfig").util.path.is_file(julia) then
			--[[ vim.notify("Hello!") ]]
			new_config.cmd[1] = julia
		end
	end,
}
