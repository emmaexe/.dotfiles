return {
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
        },
        config = function()
            vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
            vim.o.fillchars = [[eob: ,fold: ,foldopen:▼,foldsep: ,foldclose:⏵]]
            vim.o.foldcolumn = "1" -- Show a fold column
            vim.o.foldlevel = 99 -- Default open all folds
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { "lsp", "indent" }
                end,
            })

            -- Keybindings for folding
            -- vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
            -- vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
            -- vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open folds incrementally" })
            -- vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Close folds incrementally" })
        end,
    },
    {
        "luukvbaal/statuscol.nvim",
        config = function()
            -- local builtin = require("statuscol.builtin")
            require("statuscol").setup({
                -- configuration goes here, for example:
                -- relculright = true,
                -- segments = {
                --   { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
                --   {
                --     sign = { namespace = { "diagnostic/signs" }, maxwidth = 2, auto = true },
                --     click = "v:lua.ScSa"
                --   },
                --   { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
                --   {
                --     sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
                --     click = "v:lua.ScSa"
                --   },
                -- }
            })
        end,
    },
}
