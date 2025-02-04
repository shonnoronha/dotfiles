return {
	"https://github.com/mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		require("dap-go").setup()
		require("dapui").setup()

		-- Open DAP UI on start
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Key Mappings
		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Start/Continue Debugging" })
		vim.keymap.set("n", "<Leader>dx", dapui.close, { desc = "Close Debug UI" })
		vim.keymap.set("n", "<Leader>dr", dap.run_last, { desc = "Run Last Debug Session" })
		vim.keymap.set("n", "<Leader>dl", function()
			dap.run_last()
			dapui.open()
		end, { desc = "Run Last and Open UI" })

		-- F-keys for stepping through code
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debugging" })
		vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
		vim.keymap.set("n", "<Leader>dB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Set Conditional Breakpoint" })
		vim.keymap.set("n", "<Leader>dp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, { desc = "Set Logpoint" })

		-- Evaluate variables under cursor
		vim.keymap.set("n", "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end, { desc = "Hover to Inspect" })
		vim.keymap.set("n", "<Leader>ds", function()
			require("dap.ui.widgets").scopes()
		end, { desc = "Show Scopes" })
		vim.keymap.set("n", "<Leader>df", function()
			require("dap.ui.widgets").frames()
		end, { desc = "Show Stack Frames" })
	end,
}

