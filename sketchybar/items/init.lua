local colors = require("colors").sections
-- --left
-- require "items.apple"
-- require "items.menus"
require "items.spaces"
require "items.front_app"

sbar.add("bracket", { "/system\\..*/" }, {
  background = {
    height = 34,
    color = colors.bracket.bg,
    border_color = colors.bracket.border,
  },
})

--right (reverse order)
require "items.widgets"