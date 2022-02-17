vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_session_directory = require("core.utils"):create_dir(BASE_DIR .. "/_cache/sessions")

vim.g.dashboard_custom_section = {
    a = { description = { "ﭯ  Recently Used Files" }, command = "Telescope oldfiles" },
    b = { description = { "  Find File          " }, command = "Telescope find_files" },
    c = { description = { "  Find Word          " }, command = "Telescope live_grep" },
    d = { description = { "  Load Last Session  " }, command = "SessionLoad" },
    e = { description = { "  Marks              " }, command = "Telescope marks" },
    f = { description = { "  Settings           " }, command = ":e " .. BASE_DIR .. "/init.lua" },
}

local num_plugins_loaded = #vim.fn.globpath(DATA_PATH .. "/site/pack/packer/start", "*", 0, 1)
vim.g.dashboard_custom_header = {
    "                           `-/+osyyyyso+/-`                          ",
    "                       `/sdNNMs:mMMMMMMMMNNds/`                      ",
    "                    `/syhyo+/o+ `sMMMMMMMMMMMMNh/`                   ",
    "                  `+s/```         -yMMMMMMMMMMMMMm+`                 ",
    "                 :y/`               :sdNMMMMMMMMMMMd/                ",
    "               `ss`                    .omMMMMMMMMMMMs`              ",
    "              `y+                        .oMMMMMMMMMMMh`             ",
    "              y+    -` o `-             :+`+dNMMMMMMMMMy             ",
    "             /h   :o/mMMMd/o-            `   -odNMMMMMMM+            ",
    "             m.   +/dMMMMMd/+        ..`-.``  ``oMMMMMMMm            ",
    "            -d    .s/mMMMm/s. `+o:  .hMMMMdmoydNMMMMMMMMM-           ",
    "            /y       - o -    `.NMs .oMMMMMMMMMMMMMMMMMMM+           ",
    "            /y                  omMo `mNMMMMMmdmMMMMMMMMM+           ",
    "            -d        `./o.-    :dMMhosNMMMh.   .hMMMMMMM:           ",
    "             m.      oNNMMNNmdNmmMMMMMMMMMM-     .MMMMMMN            ",
    "             /h      `-sdMMMNMMMMMMMMMMMMMMh-   .yMMMMMM+            ",
    "              y+        `:yNshMMMMMMMMMMMMMMNdhdNMMMMMMy             ",
    "              `y+          omMMMMMMMMMMMMMMMMMMMMMMMMMh`             ",
    "               `ss`         .omMMMMMMMMMMMMMMMMMMMMMMs`              ",
    "                 /y/`         `:+hMMMMMMMMMMMMMMMMMm/                ",
    "                  `+s/`           /dMMMMMMMMMNMMMm+`                 ",
    "                    `/so:``         +NMsohss+odh/`                   ",
    "                       ./oso/-.``````-ds-/oso/.                      ",
    "                           `-/+oooooooo+/-`                          ",
}
vim.g.dashboard_custom_footer = {}
