
local M = {}

-- local gitsigns_bar = '▌'
--
-- local gitsigns_hl_pool = {
-- 	GitSignsAdd          = "DiagnosticOk",
-- 	GitSignsChange       = "DiagnosticWarn",
-- 	GitSignsChangedelete = "DiagnosticWarn",
-- 	GitSignsDelete       = "DiagnosticError",
-- 	GitSignsTopdelete    = "DiagnosticError",
-- 	GitSignsUntracked    = "NonText",
-- }

M.spec = {
  -- INFO: Sign column git decorations and git tools
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▎" },
        topdelete = { text = "▎" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")

        vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "Red" })
        vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = "Red" })
        vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "Orange" })
        vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "Orange" })
      end,
    },
  },

  -- INFO: Lazygit UI
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
      {"<leader>gg", "<cmd> LazyGit <cr>", desc = "Open LazyGit"},
    }
  },
}

return M
