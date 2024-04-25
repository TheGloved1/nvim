-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

-- TODO: Remove conflicting plugin settings like notification alerts, etc.
-- TODO: Also set up netrc instead of neo-tree

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
                scrolloff = 1000,
                expandtab = true,
                shiftwidth = 4,
                softtabstop = 4,
                clipboard = "unnamed,unnamedplus",
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
                ["<Leader>a"] = { desc = "Copilot" },
                ["<Leader>aa"] = { ":CopilotChatToggle<CR>", desc = "Toggle Chat" },
                ["<Leader>aq"] = {
                    function()
                        local chat = require "CopilotChat"
                        local input = vim.fn.input "Quick Chat: "
                        if input ~= "" then chat.ask(input, { selection = require("CopilotChat.select").buffer }) end
                    end,
                    desc = "Quick Chat",
                },
                ["<Leader>ab"] = { ":CopilotChatBuffer<CR>", desc = "Buffer Chat" },
                ["<Leader>ar"] = { ":CopilotChatReset<CR>", desc = "Reset Chat" },
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
                ["<C-s>"] = { ":w!<CR>", desc = "Save File" }, -- change description but the same command
                ["<Leader>pr"] = { ":AstroReload<CR>", desc = "Astro Reload" },
                ["<C-h>"] = { ":TmuxNavigateLeft<CR>", desc = "Tmux Navigate Left" },
                ["<C-j>"] = { ":TmuxNavigateDown<CR>", desc = "Tmux Navigate Down" },
                ["<C-k>"] = { ":TmuxNavigateUp<CR>", desc = "Tmux Navigate Up" },
                ["<C-l>"] = { ":TmuxNavigateRight<CR>", desc = "Tmux Navigate Right" },

                ["<Leader>T"] = { desc = "Telescope" },
                ["<Leader>Tf"] = { ":Telescope find_files<CR>", desc = "Find Files" },
                ["<Leader>Tg"] = { ":Telescope live_grep<CR>", desc = "Live Grep" },
                ["<Leader>Tb"] = { ":Telescope buffers<CR>", desc = "Buffers" },
                ["<Leader>Tw"] = { ":Telescope lsp_workspace_symbols<CR>", desc = "Workspace Symbols" },
                ["<Leader>Td"] = { ":Telescope lsp_document_symbols<CR>", desc = "Document Symbols" },
                ["<Leader>Tr"] = { ":Telescope lsp_references<CR>", desc = "References" },
                ["<Leader>Tm"] = { ":Telescope marks<CR>", desc = "Marks" },
                ["<Leader>Th"] = { ":Telescope help_tags<CR>", desc = "Help Tags" },
                ["<Leader>Tc"] = { ":Telescope colorscheme<CR>", desc = "Colorscheme" },
                ["<Leader>Tl"] = { ":Telescope lsp_workspace_diagnostics<CR>", desc = "Workspace Diagnostics" },
                ["<Leader>Ts"] = { ":Telescope lsp_document_diagnostics<CR>", desc = "Document Diagnostics" },
                ["<Leader>To"] = { ":Telescope lsp_document_code_actions<CR>", desc = "Document Code Actions" },
                ["<Leader>Ta"] = { ":Telescope lsp_code_actions<CR>", desc = "Code Actions" },
                ["<Leader>Tt"] = { ":Telescope treesitter<CR>", desc = "Treesitter" },
            },
            t = {
                -- setting a mapping to false will disable it
                -- ["<esc>"] = false,
            },
            v = {
                ["<Leader>a"] = { desc = "Copilot" },
                ["<Leader>aa"] = { ":CopilotChatToggle<CR>", desc = "Toggle Chat" },
                ["<Leader>aq"] = {
                    function()
                        local chat = require "CopilotChat"
                        local input = vim.fn.input "Quick Chat: "
                        if input ~= "" then chat.ask(input, { selection = require("CopilotChat.select").buffer }) end
                    end,
                    desc = "Quick Chat",
                },
                ["<Leader>ab"] = { ":CopilotChatBuffer<CR>", desc = "Buffer Chat" },
                ["<Leader>ar"] = { ":CopilotChatReset<CR>", desc = "Reset Chat" },

                J = { ":m '>+1<CR>gv=gv", desc = "Move line down" },
                K = { ":m '<-2<CR>gv=gv", desc = "Move line up" },
            },
        },
    },
}
