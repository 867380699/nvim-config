return {
  {
    "folke/zen-mode.nvim",
    opts = {},
    config = function()
      local on_zen_open = function()
        vim.cmd("SatelliteDisable")
      end
      local on_zen_close = function()
        vim.cmd("SatelliteEnable")
      end

      local toggleZenMode = function(on_open, on_close)
        local width = (vim.bo.filetype == "help") and 79 or 120
        require("zen-mode").toggle({
          window = {
            width = width,
          },
          on_open = on_open,
          on_close = on_close,
        })
      end
      vim.keymap.set("n", "<leader> ", function()
        toggleZenMode(on_zen_open, on_zen_close)
      end)

      vim.api.nvim_create_augroup("help-in-zen-mode", { clear = true })
      vim.api.nvim_create_autocmd("BufWinEnter", {
        group = "help-in-zen-mode",
        callback = function(event)
          local buf = event.buf
          if vim.bo.buftype == "help" and #event.file > 0 then
            vim.fn.timer_start(0, function()
              toggleZenMode(on_zen_open, function()
                on_zen_close()
                vim.cmd("bd " .. buf)
              end)
            end)
          end
        end,
      })
    end,
  },
  {
    "folke/twilight.nvim",
    opts = {},
  },
}
