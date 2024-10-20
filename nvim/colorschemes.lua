return {
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      --vim.cmd("colorscheme gruvbox")
      --vim.cmd("colorscheme gruvbox-material")
    end,
  },
  { "luisiacc/gruvbox-baby", },
  {
    "RRethy/nvim-base16",
    config = function()
      ----------------- TOP -----------------
      --vim.cmd("colorscheme onedark")
      --vim.cmd("colorscheme onenord-light")
      --vim.cmd("colorscheme base16-oceanicnext")
      --vim.cmd("colorscheme base16-darkmoss")
      --vim.cmd("colorscheme base16-gruvbox-dark-hard")

      --vim.cmd("colorscheme base16-darktooth")
      --vim.cmd("colorscheme base16-material-palenight")
      --vim.cmd("colorscheme base16-nord")
      --vim.cmd("colorscheme tokyonight-storm")
      --vim.cmd("colorscheme base16-black-metal-venom")
      --vim.cmd("colorscheme base16-black-metal-mayhem")
      --vim.cmd("colorscheme base16-greenscreen")
      --vim.cmd("colorscheme base16-bright")
      --vim.cmd("colorscheme base16-brewer")
      --vim.cmd("colorscheme base16-gotham")
      --vim.cmd("colorscheme base16-lime")

      --vim.cmd("colorscheme base16-gruvbox-light-medium") -- *****
      --vim.cmd("colorscheme base16-catppuccin-latte")
    end,
  },
  {
    "alexmozaidze/palenight.nvim",
    config = function()
      --vim.cmd("colorscheme palenight")
    end,
  },
  { "rebelot/kanagawa.nvim",
    config = function()
      --vim.cmd("colorscheme kanagawa")
    end,
  },
  { "shaunsingh/nord.nvim", },
  {
    "neanias/everforest-nvim",
    version = false,
    priority = 1000,
    lazy = false,
    config = function()
      require("everforest").setup({
        background = 'hard',
        ui_contrast = 'high',
      })
      vim.o.background='dark'
      --vim.cmd('colorscheme everforest')
    end,
  },
  {
    -- My favorite
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "deep"
      })
      vim.cmd("colorscheme onedark")
      --vim.cmd[[colorscheme onenord]]
      --vim.cmd("colorscheme tokyonight-storm")
    end
  },
  {
    -- My favorite
    "sainnhe/gruvbox-material",
    config = function()
      vim.cmd("let g:gruvbox_material_background = 'hard'")
      --vim.cmd("colorscheme gruvbox-material")
    end,
  },
  {
    "rmehri01/onenord.nvim",
  },
  {
    "Shatur/neovim-ayu",
    config = function()
      --vim.cmd("colorscheme ayu")
    end
  },
  { "mhartington/oceanic-next"},
  { "comfysage/evergarden" }
}
