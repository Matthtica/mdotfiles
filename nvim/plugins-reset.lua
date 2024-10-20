return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  { "rcarriga/nvim-notify",  enabled = false },
  {
    "folke/noice.nvim",
    enabled = false,
    -- opts = {
    --   notify = {
    --     enabled = false,
    --   },
    -- },
  },
  { "stevearc/conform.nvim", enabled = false },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 22
      }
    }
  }
}
