require("mini.comment").setup()
-- require("mini.basics").setup()
require("mini.pairs").setup()
require("mini.files").setup()
require("mini.sessions").setup({
    directory = "/home/hannes/.config/nvim/sessions/"
})

require("mini.surround").setup({
})

local header_art =
[[
 ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
 │││├┤ │ │╰┐┌╯││││
 ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
]]

header_art =
[[
                    _
               (____/@\____)
                \\\\_V_////
             (__|_H_|I|_H_|__)
              \\\\\\_V_//////
           (___|_H_|III|_H__|__)
            \\\\\\\\_V_////////
         (___|_H__|IIIII|__H__|__)
  .:.     \\\\\\\\\\_V_//////////     .:.
.:.|' (____|__H__|IIIIIII|__H__|____) '|.:.
'|'|   \\\\\\\\\\\\\\V//////////////   |'|'
 |      |_H__H__|III   III|__H__H_|      |
]]

require("mini.starter").setup({
    header = header_art,
    footer = '',
})
