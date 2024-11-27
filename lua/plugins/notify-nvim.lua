local config = function()
  require("notify").setup({
    stages = "fade_in_slide_out",
    timeout = 1000,
    background_colour = "#000000",
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
  })
end

return {
  "rcarriga/nvim-notify",
  config = config,
}
