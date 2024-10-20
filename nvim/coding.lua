return {
  --{
  --  "garymjr/nvim-snippets",
  --  opts = {
  --    friendly_snippets = true,
  --  },
  --  dependencies = {
  --    "rafamadriz/friendly-snippets",
  --  },
  --},
  --{ "rafamadriz/friendly-snippets" },

  {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      cmd = "LazyDev",
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
          { path = "LazyVim", words = { "LazyVim" } },
          { path = "lazy.nvim", words = { "LazyVim" } },
        },
      },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    -- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
  },

  --{
  --  'tzachar/cmp-tabnine',
  --  build = './install.sh',
  --  dependencies = { 'hrsh7th/nvim-cmp' },
  --  lazy = true,
  --  opts = {
  --    max_lines = 1000,
  --    max_num_results = 10,
  --    sort = true,
  --    run_on_every_keystroke = true,
  --    snippet_placeholder = '..',
  --    show_prediction_strength = true,
  --    min_percent = 0,
  --  }
  --},
  
  {
    "hrsh7th/nvim-cmp",

    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
    },
    -- Not all LSP servers add brackets when completing a function.
    -- To better deal with this, LazyVim adds a custom option to cmp,
    -- that you can configure. For example:
    --
    -- ```lua
    -- opts = {
    --   auto_brackets = { "python" }
    -- }
    -- ```
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      local auto_select = false

      opts.completion = {
        completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
      }
      opts.preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        --["<A-y>"] = require('minuet').make_cmp_map()
      })
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        --{ name = "minuet" },
        -- { name = "snippets", priority_weight = 7.0 }, -- Disabled because of Github Copilot is better
        -- { name = "cmp_tabnine", priority_weight = 6.0 }, -- Disabled because of Github Copilot, and further configuration is require
        { name = "path" },
        -- { name = "emoji", priority_weight = 1.0 }, -- Don't require for now
        -- { name = "lazydev", group_index = 0.0 } -- Don't know what it actually does
      }, {
        -- { name = "buffer" }, -- Couldn't find a use case for this
      })
      opts.sorting = {
        priority_weight = 2.0,
        comparators = {
          --require('cmp_tabnine.compare'),
          cmp.config.compare.locality,
          cmp.config.compare.recently_used,
          cmp.config.compare.score,
          cmp.config.compare.offset,
          cmp.config.compare.order,
          cmp.config.compare.kind
        }
      }
    end,
    main = "lazyvim.util.cmp",
  },

  --{
  --  'zbirenbaum/copilot.lua',
  --  cmd = "Copilot",
  --  event = "InsertEnter",
  --  build = ":Copilot auth",
  --  opts = {
  --    suggestion = {
  --      enabled = true,
  --      auto_trigger = true,
  --      hide_during_completion = false,
  --      debounce = 65,
  --      keymap = {
  --        accept = "<M-;>",
  --        accept_word = "<M-w>",
  --        accept_line = "<M-l>",
  --        next = "<M-]>",
  --        prev = "<M-[>",
  --        dismiss = "<C-]>"
  --      }
  --    },
  --    panel = {
  --      enabled = true,
  --      auto_refresh = false,
  --      keymap = {
  --        jump_prev = "[[",
  --        jump_next = "]]",
  --        accept = "<CR>",
  --        refresh = "gr",
  --        open = "<M-CR>"
  --      },
  --      layout = {
  --        position = "right",
  --        ratio = 0.4
  --      }
  --    },
  --    filetypes = {
  --      markdown = true,
  --      help = true,
  --      ["*"] = true,
  --    }
  --  }
  --},

  --{
  --  "CopilotC-Nvim/CopilotChat.nvim",
  --  branch = "canary",
  --  dependencies = {
  --    { "zbirenbaum/copilot.lua" },
  --    { "nvim-lua/plenary.nvim" },
  --  },
  --  build= "make tiktoken",
  --  opts = {
  --    debug = true
  --  },
  --},

  --{
  --  "Exafunction/codeium.vim",
  --  config = function()
  --    vim.g.codeium_disable_bindings = 1
  --    vim.keymap.set('i', '<M-;>', function() return vim.fn['codeium#Accept']() end, { expr = true })
  --    vim.keymap.set('i', '<M-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
  --    vim.keymap.set('i', '<M-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
  --    vim.keymap.set('i', '<C-]>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  --  end,
  --},
  --{
  --  'milanglacier/minuet-ai.nvim',
  --  config = function()
  --    require('minuet').setup {
  --      provider = 'openai_compatible',
  --      throttle = 50,
  --      debounce = 20,
  --      request_timeout = 1,
  --      provider_options = {
  --        opanai_compatible = {
  --          model = 'llama-3.1-70b-versatile',
  --          system = require('minuet.config').default_system,
  --          few_shots = require('minuet.config').default_few_shots,
  --          end_point = 'https://api.groq.com/openai/v1/chat/completions',
  --          api_key = 'GROQ_API_KEY',
  --          name = 'Groq',
  --          stream = true,
  --          optional = {
  --            stop = nil,
  --            max_tokens = 200,
  --          },
  --        }
  --      }
  --    }
  --  end
  --},

  --{
  --  "frankroeder/parrot.nvim",
  --  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
  --  config = function()
  --    require("parrot").setup {
  --      providers = {
  --        groq = {
  --          api_key = '',
  --          endpoint = 'https://api.groq.com/openai/v1/chat/completions'
  --        }
  --      }
  --    }
  --  end,
 -- },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<M-;>",
          accept_word = "<M-l>",
        }
      })
    end,
  }
}
