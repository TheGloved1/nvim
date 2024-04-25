-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/edluffy/specs.nvim
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
    "edluffy/specs.nvim",
    config = function()
        require("specs").setup {
            show_jumps = true,
            min_jump = 10,
            popup = {
                delay_ms = 0, -- delay before popup displays
                inc_ms = 10, -- time increments used for fade/resize effects
                blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
                width = 10,
                winhl = "PMenu",
                fader = require("specs").linear_fader,
                resizer = require("specs").shrink_resizer,
            },
            ignore_filetypes = {},
            ignore_buftypes = {
                nofile = true,
            },
        }
    end,
}
