-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        -- Configure core features of AstroNvim
        features = {
            large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
            autopairs = true, -- enable autopairs at start
            cmp = true, -- enable completion at start
            diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
            highlighturl = true, -- highlight URLs at start
            notifications = true, -- enable notifications at start
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
            virtual_text = true,
            underline = true,
        },
        -- vim options can be configured here
        options = {
            opt = { -- vim.opt.<key> relativenumber = true, -- sets vim.opt.relativenumber
                number = true, -- sets vim.opt.number
                spell = false, -- sets vim.opt.spell
                signcolumn = "auto", -- sets vim.opt.signcolumn to auto
                wrap = false, -- sets vim.opt.wrap
                tabstop = 4,
                smartindent = true,
                scrolloff = 10,
                expandtab = true,
                shiftwidth = 4,
                softtabstop = 4,
                clipboard = "unnamedplus",
            },
            g = { -- vim.g.<key>
                -- configure global vim variables (vim.g)
                -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup` This can be found in the `lua/lazy_setup.lua` file
            },
        },
        -- Mappings can be configured through AstroCore as well.
        -- NOTE: keycodes follow the casing in the vimdocs.x For example, `<Leader>` must be capitalized
        mappings = {
            -- first key is the mode
            n = {
                -- second key is the lefthand side of the map
                -- navigate buffer tabs with `H` and `L`
                L = {
                    function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
                    desc = "Next buffer",
                },
                H = {
                    function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
                    desc = "Previous buffer",
                },
                ["<Leader>a"] = { desc = "Copilot Chat" },
                ["<Leader>aa"] = { ":CopilotChatToggle<CR>", desc = "Copilot Chat Toggle" },
                ["<Leader>aq"] = {
                    function()
                        local chat = require "CopilotChat"
                        local input = vim.fn.input "Quick Chat: "
                        if input ~= "" then chat.ask(input, { selection = require("CopilotChat.select").buffer }) end
                    end,
                    desc = "Copilot Quick Chat",
                },
                ["<Leader>ab"] = { ":CopilotChatBuffer<CR>", desc = "Copilot Chat Buffer" },
                ["<Leader>ar"] = { ":CopilotChatReset<CR>", desc = "Copilot Chat Reset" },
                ["<Leader>bD"] = {
                    function()
                        require("astroui.status.heirline").buffer_picker(
                            function(bufnr) require("astrocore.buffer").close(bufnr) end
                        )
                    end,
                    desc = "Pick to close",
                },
                -- tables with just a `desc` key will be registered with which-key if it's installed
                -- this is useful for naming menus
                ["<Leader>b"] = { desc = "Buffers" },
                -- quick save
                ["<C-s>"] = { ":w!<CR>", desc = "Save File" }, -- change description but the same command
                ["<Leader>pr"] = { ":AstroReload<CR>", desc = "Astro Reload" },
                ["<C-h>"] = { ":TmuxNavigateLeft<CR>", desc = "Tmux Navigate Left" },
                ["<C-j>"] = { ":TmuxNavigateDown<CR>", desc = "Tmux Navigate Down" },
                ["<C-k>"] = { ":TmuxNavigateUp<CR>", desc = "Tmux Navigate Up" },
                ["<C-l>"] = { ":TmuxNavigateRight<CR>", desc = "Tmux Navigate Right" },
                -- Oil
                ["-"] = { ":Oil<CR>", desc = "Open Parent Directory" },
            },
            t = {
                -- setting a mapping to false will disable it
                -- ["<esc>"] = false,
            },
            v = {
                ["<Leader>a"] = { desc = "Copilot Chat" },
                ["<Leader>aa"] = { ":CopilotChatToggle<CR>", desc = "AI Toggle" },
                ["<Leader>aq"] = {
                    function()
                        local chat = require "CopilotChat"
                        local input = vim.fn.input "Quick Chat: "
                        if input ~= "" then chat.ask(input, { selection = require("CopilotChat.select").buffer }) end
                    end,
                    desc = "Copilot Quick Chat",
                },

                ["<Leader>ab"] = { ":CopilotChatBuffer<CR>", desc = "AI Buffer" },
                ["<Leader>ar"] = { ":CopilotChatReset<CR>", desc = "AI Reset" },
                J = { ":m '>+1<CR>gv=gv", desc = "Move line down" },
                K = { ":m '<-2<CR>gv=gv", desc = "Move line up" },
            },
        },
    },
}
