return {
    'L3MON4D3/LuaSnip',
    config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
        local ls = require("luasnip")
        local snip = ls.snippet
        local node = ls.snippet_node
        local text = ls.text_node
        local insert = ls.insert_node
        local func = ls.function_node
        local choice = ls.choice_node
        local dyn = ls.dynamic_node

        local js_ts_snips = {
            snip({ trig = "cl", dscr = "Print out to the console" },
                { text({ 'console.log(' }), insert(1), text({ ');' }), insert(2) }),
            snip({ trig = "fn", dscr = "Basic function declaration" },
                { text({ 'function ' }), insert(1), text({ "(" }), insert(2), text({ ') {', '\t' }), insert(3),
                    text({ '\t', '};' }) })
        }

        local date = function() return { os.date('%Y-%m-%d') } end

        ls.add_snippets(nil, {
            all = {
                snip({
                    trig = "date",
                    namr = "Date",
                    dscr = "Date in the form of YYYY-MM-DD",
                }, {
                    func(date, {}),
                }),
            },
            go = {
                snip('fn', {
                    text({ 'func ' }), insert(1), text({ '() {' }), insert(2), text({ '};' })
                })
            },
            javascript = js_ts_snips,
            typescript = js_ts_snips,
        })
    end,
}
