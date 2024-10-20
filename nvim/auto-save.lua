return {
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enable = true,
      conditions = {
        exists = true,
        modifiable = true,
        filetype_is_not = { "rs" },
      },
      debounce_delay = 2000,
    })
  end,
  event = "InsertLeave",
}
