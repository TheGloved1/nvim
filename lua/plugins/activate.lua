return {
    "roobert/activate.nvim",
    dependencies = {
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
        {
            "AstroNvim/astrocore",
            opts = {
                mappings = {
                    n = {
                        ["<Leader>P"] = { function() require("activate").list_plugins() end, desc = "Plugins" },
                    },
                },
            },
        },
    },
}
