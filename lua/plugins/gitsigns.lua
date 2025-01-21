return {
  {
    "tpope/vim-fugitive"
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]h", function()
            if vim.wo.diff then
              return "]h"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, desc = "Next hunk" })

          map("n", "[h", function()
            if vim.wo.diff then
              return "[h"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true, desc = "Previous hunk" })

          -- Actions
          -- Stage
          map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
          map("v", "<leader>gs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "Stage selected hunks" })
          map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" })

          -- Reset/Undo
          map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
          map("v", "<leader>gr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "Reset selected hunks" })
          map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
          map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })

          -- Preview
          map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
          map("n", "<leader>gP", gs.preview_hunk_inline, { desc = "Preview hunk inline" })

          -- Diff view
          map("n", "<leader>gd", gs.diffthis, { desc = "Diff this" })
          map("n", "<leader>gD", function()
            gs.diffthis("~")
          end, { desc = "Diff this ~" })

          -- Blame
          map("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
          map("n", "<leader>gB", function()
            gs.blame_line({ full = true })
          end, { desc = "Blame line" })

          -- Misc
          map("n", "<leader>gl", gs.toggle_deleted, { desc = "Toggle deleted" })
          map("n", "<leader>gw", gs.toggle_word_diff, { desc = "Toggle word diff" })
        end,
      })
    end,
  },
}
