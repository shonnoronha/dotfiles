return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
	opts = {},
	config = function()
		require("render-markdown").setup({
			filetypes = { "markdown", "mdx" },
		})

		vim.filetype.add({
			extension = {
				mdx = "markdown",
			},
		})
	end,
}
