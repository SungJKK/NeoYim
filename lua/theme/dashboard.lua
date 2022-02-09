vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {'ﭯ  Recently Used Files'}, command = 'Telescope oldfiles'},
    b = {description = {'  Find File          '}, command = 'Telescope find_files'},
    c = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    d = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    e = {description = {'  Marks              '}, command = 'Telescope marks'},
    f = {description = {'  Settings           '}, command = ':e '..BASE_DIR..'/init.lua'},
}

SESSION_DIR = BASE_DIR .. '/_cache_dir/sessions'
function exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok, err
end
if not exists(UNDO_DIR) then
    print('Creating _cache_dir/sessions for cached sessions...')
    require('os')
    os.execute('mkdir ' .. SESSION_DIR)
end
vim.g.dashboard_session_directory = SESSION_DIR

local num_plugins_loaded = #vim.fn.globpath(DATA_PATH .. "/site/pack/packer/start", "*", 0, 1)
vim.g.dashboard_custom_header = {
    '                           `-/+osyyyyso+/-`                          ',
    '                       `/sdNNMs:mMMMMMMMMNNds/`                      ',
    '                    `/syhyo+/o+ `sMMMMMMMMMMMMNh/`                   ',
    '                  `+s/```         -yMMMMMMMMMMMMMm+`                 ',
    '                 :y/`               :sdNMMMMMMMMMMMd/                ',
    '               `ss`                    .omMMMMMMMMMMMs`              ',
    '              `y+   -` o `-              .oMMMMMMMMMMMh`             ',
    '              y+  `./o-y-s/.`           :+`+dNMMMMMMMMMy             ',
    '             /h   :o/mMMMd/o-            `   -odNMMMMMMM+            ',
    '             m.  -+/dMMMMMd/+-       ..`-.``  ``oMMMMMMMm            ',
    '            -d    .s/mMMMm/s. `+o:  .hMMMMdmoydNMMMMMMMMM-           ',
    '            /y    . :o-h-o: . `.NMs .oMMMMMMMMMMMMMMMMMMM+           ',
    '            /y      -  o  -     omMo `mNMMMMMmdmMMMMMMMMM+           ',
    '            -d        `./o.-    :dMMhosNMMMh.   .hMMMMMMM:           ',
    '             m.      oNNMMNNmdNmmMMMMMMMMMM-     .MMMMMMN            ',
    '             /h      `-sdMMMNMMMMMMMMMMMMMMh-   .yMMMMMM+            ',
    '              y+        `:yNshMMMMMMMMMMMMMMNdhdNMMMMMMy             ',
    '              `y+          omMMMMMMMMMMMMMMMMMMMMMMMMMh`             ',
    '               `ss`         .omMMMMMMMMMMMMMMMMMMMMMMs`              ',
    '                 /y/`         `:+hMMMMMMMMMMMMMMMMMm/                ',
    '                  `+s/`           /dMMMMMMMMMNMMMm+`                 ',
    '                    `/so:``         +NMsohss+odh/`                   ',
    '                       ./oso/-.``````-ds-/oso/.                      ',
    '                           `-/+oooooooo+/-`                          ',
    '',
    '',
    '                           Loaded ' .. num_plugins_loaded .. ' packages           ',
}

vim.g.dashboard_custom_footer = {
}

