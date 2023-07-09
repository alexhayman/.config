return {
    -- Telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files"},
        },
    },
    -- Colorscheme
    {
        'rebelot/kanagawa.nvim',
        lazy = false,
        config = function()
            vim.cmd([[colorscheme kanagawa]])
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },
    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        depedencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.config.lualine")
        end,
    },
    -- Neo-tree
    {
        'nvim-neo-tree/neo-tree.nvim', branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        keys = {
            {"<C-n>", "<cmd>Neotree toggle<cr>", desc = "NeoTree"},

        },
        config = function()
            require("plugins.config.neo-tree")
        end,
    },
    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require("plugins.config.treesitter")
        end,
    },
    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                build = function()
                    vim.cmd([[MasonUpdate]])
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        },
        config = function()
            require("plugins.config.lsp")
        end,
    }
}