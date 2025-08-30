-- @file: ~/.config/nvim/init.lua

-- chamadas init root --
require("config.lazy")
require("custom.terminal_custom")
require('custom.create_file')
require("config.custom_highlights")
require('custom.no_format_on_save').setup()
require('custom.header_create')
require('custom.git_dashboard')
require('custom.git_exe')
require('custom.git-config')
