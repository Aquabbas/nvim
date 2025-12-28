-- ------------------------------------------------------------
-- Check LazyVim Docs: https://www.lazyvim.org/extras/test/core
-- ------------------------------------------------------------
return {
    "nvim-neotest/neotest",
    lazy = true,
    -- -------------
    -- PHPUnit Tests
    -- -------------
    dependencies = { "olimorris/neotest-phpunit" },
    opts = {
        adapters = { "neotest-phpunit" },
    },
}
