local status, feline = pcall(require, "feline")
if not status then
    print("Failed loading feline")
end

-- "┃", "│", "", "", "█", "", "", "", "", "", "", "", "", "", ""

local modeColors = {
    NORMAL = "green",
    COMMAND = "skyblue",
    INSERT = "orange",
    REPLACE = "red",
    LINES = "violet",
    VISUAL = "violet",
    OP = "yellow",
    BLOCK = "yellow",
    ENTER = "yellow",
    MORE = "yellow",
    SELECT = "yellow",
    SHELL = "yellow",
    TERM = "yellow",
    NONE = "yellow",
}

local gruvbox = {
    fg = "#ebdbb2",
    bg = "#3c3836",
    black = "#3c3836",
    skyblue = "#83a598",
    cyan = "#8e07c",
    green = "#b8bb26",
    oceanblue = "#076678",
    blue = "#458588",
    magenta = "#d3869b",
    orange = "#d65d0e",
    red = "#cc241d",
    violet = "#b16286",
    white = "#ebdbb2",
    yellow = "#d79921",
    gray = "#928374",
}

local left = {{
    left_sep = "█",
    provider = { name = "vi_mode", opts = { show_mode_name = true }, },
    hl = function()
        return {
            fg = "black", bg = require("feline.providers.vi_mode").get_mode_color(),
        }
    end,
},{
    provider = "",
    hl = function()
        return {
            fg = require("feline.providers.vi_mode").get_mode_color(), bg = "blue",
        }
    end,
},{
    left_sep = "█",
    provider = "git_branch",
    hl = {
        fg = "black", bg = "blue",
    },
},{
    provider = "git_diff_added",
    hl = {
        fg = "green", bg = "blue",
    },
},{
    provider = "git_diff_changed",
    hl = {
        fg = "orange", bg = "blue",
    },
},{
    provider = "git_diff_removed",
    hl = {
        fg = "red", bg = "blue",
    },
},{
    left_sep = "█",
    provider = "",
    hl = {
        fg = "bg", bg = "blue"
    }
},{
    hl = {
        bg = "bg",
    }
}
}

local mid = {{
    provider = {
        name = "file_info",
        opts = {
            type = "relative",
        },
    },
}
}

local right = {{
    provider = "",
    hl = {
        fg = "red", bg = "bg",
    }
},{
    provider = "diagnostic_errors",
    hl = {
        fg = "black", bg = "red",
    }
},{
    provider = "",
    hl = {
        fg = "yellow", bg = "red",
    }
},{
    provider = "diagnostic_warnings",
    hl = {
        fg = "black", bg = "yellow",
    }
},{
    provider = "",
    hl = {
        fg = "green", bg = "yellow",
    }
},{
    provider = "diagnostic_hints",
    hl = {
        fg = "black", bg = "green",
    }
},{
    provider = "",
    hl = {
        fg = "gray", bg = "green",
    }
},{
    provider = "lsp_client_names",
    hl = {
        fg = "black", bg = "gray",
    },
},{
    provider = "┃",
    hl = {
        fg = "bg", bg = "gray",
    },
},{
    provider = {
        name = "file_type", opts = { filetype_icon = true, case = "titlecase" },
    },
    hl = {
        fg = "black", bg = "gray"
    }
},{
    provider = "",
    hl = {
        fg = "yellow", bg = "gray",
    },
},{
    provider = "file_encoding",
    hl = {
        fg = "black", bg = "yellow",
    },
},{
    provider = "",
    hl = {
        fg = "orange", bg = "yellow",
    },
},{
    provider = "position",
    hl = {
        fg = "black", bg = "orange",
    },
},{
    left_sep = "█",
    provider = "line_percentage",
    hl = {
        fg = "black", bg = "orange",
    },
    right_sep = "███",
},
}

local components = {
    active = { left, mid, right },
    inactive = { mid },
}

feline.setup({
    theme = gruvbox,
    components = components,
    vi_mode_colors = modeColors,
})

