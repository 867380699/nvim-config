return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  {
    -- brew install gcc
    -- CC=gcc-13 nvim -c "TSInstall norg"
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {
            config = {
              -- icon_preset = "diamond",
              icons = {
                code_block = {
                  conceal = true,
                  width = "content",
                  padding = {
                    left = 1,
                    right = 1,
                  },
                  nodes = { "ranged_verbatim_tag" },
                  highlight = "CursorLine",
                },
              },
            },
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.summary"] = {
            config = {
              strategy = "by_path",
            },
          },
          ["core.completion"] = {
            -- for link completion
            config = {
              engine = "nvim-cmp",
              name = "[Neorg]",
            },
          },
          ["core.keybinds"] = {
            config = {
              hook = function(keybinds)
                keybinds.remap_key("norg", "i", "<M-CR>", "<C-CR>")
              end,
            },
          },
        },
      })
    end,
  },
}
