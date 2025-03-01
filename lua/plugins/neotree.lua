return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
			},
		},
	},
	config = function()
		vim.keymap.set("n", "<Leader>b", ":Neotree toggle<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<Leader>n", ":Neotree focus<CR>", { noremap = true, silent = true })
	end,
}
