-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.vue" },
    { import = "astrocommunity.pack.python" },
    { import = "astrocommunity.completion.copilot-lua" },
    { import = "astrocommunity.completion.copilot-lua-cmp" },
    { import = "astrocommunity.keybinding.mini-clue" },
    { import = "astrocommunity.git.nvim-tinygit" },
    { import = "astrocommunity.editing-support.undotree" },
    { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },
    { import = "astrocommunity.colorscheme.catppuccin" },
    { import = "astrocommunity.colorscheme.rose-pine" },
    -- { import = "astrocommunity.git.octo-nvim" },
    { import = "astrocommunity.utility.noice-nvim" },
    { import = "astrocommunity.motion.hop-nvim" },
    { import = "astrocommunity.editing-support.wildfire-nvim" },
    -- { import = "astrocommunity.lsp.lsp-signature-nvim" },
    { import = "astrocommunity.bars-and-lines.vim-illuminate" },
    { import = "astrocommunity.motion.harpoon" },
    { import = "astrocommunity.motion.vim-matchup" },
    { import = "astrocommunity.color.modes-nvim" },
    { import = "astrocommunity.color.nvim-highlight-colors" },
    { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },
    { import = "astrocommunity.lsp.garbage-day-nvim" },
    { import = "astrocommunity.utility.nvim-toggler" },
    -- { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
    -- { import = "astrocommunity.recipes.heirline-clock-statusline" },

    -- { import = "astrocommunity." },
    -- import/override with your plugins folder
}
