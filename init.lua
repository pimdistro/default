local util = require("util")
local bindings = require("custom.bindings")

-- map the custom keybindings
util.map_keybindings_deferred(bindings)

-- setup colorscheme
require("colorbuddy").colorscheme("pim")
