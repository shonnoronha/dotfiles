return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 10,
				open_mapping = [[<C-\>]],
				hide_numbers = true,
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "horizontal",
				close_on_exit = true,
				shell = vim.o.shell,
				float_opts = {
					border = "curved",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})

			vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
			vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle float terminal" })
			vim.keymap.set(
				"n",
				"<leader>th",
				"<cmd>ToggleTerm direction=horizontal<CR>",
				{ desc = "Toggle horizontal terminal" }
			)
			vim.keymap.set(
				"n",
				"<leader>tv",
				"<cmd>ToggleTerm direction=vertical<CR>",
				{ desc = "Toggle vertical terminal" }
			)

			vim.keymap.set("n", "<leader>t1", "<cmd>1ToggleTerm<CR>", { desc = "Toggle terminal 1" })
			vim.keymap.set("n", "<leader>t2", "<cmd>2ToggleTerm<CR>", { desc = "Toggle terminal 2" })
			vim.keymap.set("n", "<leader>t3", "<cmd>3ToggleTerm<CR>", { desc = "Toggle terminal 3" })
			vim.keymap.set("n", "<leader>t4", "<cmd>4ToggleTerm<CR>", { desc = "Toggle terminal 4" })

			vim.keymap.set("n", "<leader>t+", "<cmd>ToggleTermSetSize +2<CR>", { desc = "Increase terminal size" })
			vim.keymap.set("n", "<leader>t-", "<cmd>ToggleTermSetSize -2<CR>", { desc = "Decrease terminal size" })

			vim.keymap.set("n", "<leader>tn", "<cmd>bnext<CR>", { desc = "Next terminal" })
			vim.keymap.set("n", "<leader>tp", "<cmd>bprevious<CR>", { desc = "Previous terminal" })

			vim.keymap.set("n", "<leader>ts", function()
				local cmd = vim.fn.input("Command: ")
				if cmd ~= "" then
					require("toggleterm").send_lines_to_terminal(cmd, true, true)
				end
			end, { desc = "Send command to terminal" })

			vim.keymap.set("n", "<leader>tk", "<cmd>ToggleTermKill<CR>", { desc = "Kill current terminal" })

			function _G.set_terminal_keymaps()
				local terminal_opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], terminal_opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], terminal_opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], terminal_opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], terminal_opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], terminal_opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], terminal_opts)
			end

			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
}
