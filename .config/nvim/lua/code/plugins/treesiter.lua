return {{
    "nvim-treesitter/nvim-treesitter",
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        -- configure treesitter
        treesitter.setup({ -- enable syntax highlighting
            highlight = {
                enable = true
            },
            -- enable indentation
            indent = {
                enable = true
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>s",
                    node_incremental = "<leader>s",
                    scope_incremental = false,
                    node_decremental = "<bs>"
                }
            }
        })
    end
}, {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    ft = {"go"},
    config = function()

        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
        -- Repeat movement with ; and ,
        -- ensure ; goes forward and , goes backward regardless of the last direction
        vim.keymap.set({"n", "x", "o"}, ";", ts_repeat_move.repeat_last_move_next)
        vim.keymap.set({"n", "x", "o"}, ",", ts_repeat_move.repeat_last_move_previous)
        vim.keymap.set({"n", "x", "o"}, "f", ts_repeat_move.builtin_f_expr, {
            expr = true
        })
        vim.keymap.set({"n", "x", "o"}, "F", ts_repeat_move.builtin_F_expr, {
            expr = true
        })
        vim.keymap.set({"n", "x", "o"}, "t", ts_repeat_move.builtin_t_expr, {
            expr = true
        })
        vim.keymap.set({"n", "x", "o"}, "T", ts_repeat_move.builtin_T_expr, {
            expr = true
        })
        require "code.config.textobjects"
    end
}}
