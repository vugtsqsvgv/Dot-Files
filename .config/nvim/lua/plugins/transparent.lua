-- ~/.config/nvim/lua/plugins/transparent.lua
return {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      vim.cmd("TransparentEnable")
    end,
  },
}
