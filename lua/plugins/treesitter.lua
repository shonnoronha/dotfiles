return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			auto_install = true,
			ensure_installed = { "markdown", "markdown_inline" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			additional_vim_regex_highlighting = { "mdx" },
		})
	end,
}
