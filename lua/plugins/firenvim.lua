return {
  "glacambre/firenvim",
  lazy = not vim.g.started_by_firenvim,
  build = function()
    vim.fn["firenvim#install"](0)
  end,
  config = function()
    vim.g.firenvim_config = {
      localSettings = {
        [".*"] = {
          takeover = "never",
        },
      },
    }
    vim.api.nvim_create_autocmd({ "UIEnter" }, {
      callback = function()
        local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
        if client ~= nil and client.name == "Firenvim" then
          vim.o.laststatus = 0
          vim.o.showtabline = 0
          vim.o.signcolumn = "no"
          vim.o.foldcolumn = "0"
          vim.fn.timer_start(100, function()
            if vim.o.lines < 12 then
              vim.o.lines = 12
            end
          end)
        end
      end,
    })
  end,
}
