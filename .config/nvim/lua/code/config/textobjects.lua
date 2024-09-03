require("nvim-treesitter.configs").setup({
    textobjects = {
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]]"] = "@function.outer",
                ["}}"] = "@parameter.inner"
                -- ["]]"] = { query = "@class.outer", desc = "Next class start" },
                --
                -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
                -- ["]o"] = "@loop.*",
                -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                --
                -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                -- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
                -- ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[["] = "@function.outer"
                -- ["[["] = "@class.outer",
            },
            goto_previous_end = {
                -- ["{{"] = "@function.outer"
                -- ["[]"] = "@class.outer",
            },
            -- Below will go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            -- Make it even more gradual by adding multiple queries and regex.
            goto_next = {
                -- ["]d"] = "@conditional.outer",
            },
            goto_previous = {
                -- ["[d"] = "@conditional.outer",
            }
        },
        select = {
            enable = true,
            keymaps = {
                ["ll"] = {
                    query = "@assignment.lhs",
                    desc = "Select left hand side of an assignment"
                },
                ["rr"] = {
                    query = "@assignment.rhs",
                    desc = "Select right hand side of an assignment"
                },
                ["ip"] = {
                    query = "@parameter.inner",
                    desc = "Select outer part of a parameter/argument"
                },
                ["ap"] = {
                    query = "@parameter.outer",
                    desc = "Select outer part of a parameter/argument"
                },

                ["ai"] = {
                    query = "@conditional.outer",
                    desc = "Select outer part of a conditional"
                },
                ["ii"] = {
                    query = "@conditional.inner",
                    desc = "Select inner part of a conditional"
                },
                ["if"] = {
                    query = "@call.inner",
                    desc = "Select inner part of a function call"
                },
                -- You can use the capture groups defined in textobjects.scm
                -- ["af"] = "@function.outer",
                -- ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"

            },
            lookahead = true -- Automatically jump forward to textobj, similar to targets.vim
        }
    }
})
