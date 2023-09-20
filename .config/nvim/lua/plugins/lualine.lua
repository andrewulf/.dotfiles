local mode_map = {
    ["n"] = "NOR",
    ["no"] = "O·P",
    ["nov"] = "O·P",
    ["noV"] = "O·P",
    ["no\22"] = "O·P",
    ["niI"] = "N·I",
    ["niR"] = "N·R",
    ["niV"] = "N",
    ["nt"] = "N·T",
    ["v"] = "VIS",
    ["vs"] = "V",
    ["V"] = "VIS·L",
    ["Vs"] = "VIS·L",
    ["\22"] = "VIS·B",
    ["\22s"] = "VIS·B",
    ["s"] = "S",
    ["S"] = "S·L",
    ["\19"] = "S·B",
    ["i"] = "INS",
    ["ic"] = "I·C",
    ["ix"] = "I·X",
    ["R"] = "R",
    ["Rc"] = "R·C",
    ["Rx"] = "R·X",
    ["Rv"] = "V·R",
    ["Rvc"] = "RVC",
    ["Rvx"] = "RVX",
    ["c"] = "C",
    ["cv"] = "EX",
    ["ce"] = "EX",
    ["r"] = "R",
    ["rm"] = "M",
    ["r?"] = "C",
    ["!"] = "SH",
    ["t"] = "T",
}

local function modes()
    return mode_map[vim.api.nvim_get_mode().mode] or "__"
end


local colors = {
    blue     = '#009CFF',
    yellow   = '#F5DF4E',
    cherry   = '#b16286',
    black    = '#181825',
    white    = '#fff',
    red      = '#E3583E',
    green    = '#91e856',
    flamingo = '#F7CAC9',
    grey     = '#1e1e2e',
    teal     = "#88DCFD"
}

local custom_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.green },
        b = { fg = colors.white, bg = nil },
        c = { fg = colors.black, bg = nil },
    },
    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.yellow } },
    replace = { a = { fg = colors.black, bg = colors.red } },
    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}

local conditions = {
    not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

return {
    "nvim-lualine/lualine.nvim",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('lualine').setup({
            options = {
                theme = custom_theme,
                component_separators = "|",
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = {
                    { modes, color = { gui = "bold" }, separator = { right = "" }, right_padding = 2 },
                },
                lualine_b = {
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = { error = " ", warn = " ", info = " " },
                        diagnostics_color = {
                            color_error = { fg = colors.red },
                            color_warn = { fg = colors.yellow },
                            color_info = { fg = colors.blue },
                        },
                    },
                    {
                        "filename",
                        path = 1,
                        file_status = true,
                        color = { fg = colors.white, gui = "bold" },
                        separator = { right = "" },
                        cond = conditions.not_empty,
                    },
                    {
                        "branch",
                        color = { fg = colors.flamingo, gui = "bold" },
                        separator = { right = "" },
                    },
                    {
                        "diff",
                        symbols = { added = " ", modified = "柳", removed = " " },
                        separator = { right = "", left = "" },
                        diff_color = {
                            added = { fg = colors.green },
                            modified = { fg = colors.yellow },
                            removed = { fg = colors.red },
                        },
                    },
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {
                    {
                        "filesize",
                        color = { gui = "bold", fg = colors.white },
                        cond = conditions.not_empty,
                    },
                    {
                        "filetype",
                        color = { gui = "bold", fg = colors.teal },
                    },
                    {
                        "fileformat",
                        symbols = {
                            unix = "UNIX", -- e712
                            dos = "", -- e70f
                            mac = "", -- e711
                        },
                        color = { gui = "bold", fg = colors.cherry },
                    },
                    { "progress", color = { gui = "bold", fg = colors.teal } },
                },
                lualine_z = {
                    {
                        "location",
                        separator = { left = "" },
                        left_padding = 2,
                        color = { gui = "bold", bg = colors.teal },
                    },
                },
            },
            inactive_sections = {
                lualine_a = { "filename" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "location" },
            },
            tabline = {},
            extensions = {},
        })
    end,
}
