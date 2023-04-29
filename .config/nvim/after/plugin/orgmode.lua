local ok, orgmode = pcall(require, 'orgmode')
if not ok then return end

local conf = {
  org_agenda_files = { '~/org/*' },
  org_todo_keywords = { 'TODO(t)', 'WORK', '|', 'DONE' },
  org_todo_keyword_faces = {
    WORK = ':foreground #D8A657 :weight bold',
  },
  org_blank_before_new_entry = { heading = false, plain_list_item = false }
}

orgmode.setup_ts_grammar()
orgmode.setup(conf)

local ok, bullets = pcall(require, 'org-bullets')
if not ok then return end

bullets.setup()

local ok, wk = pcall(require, 'which-key')
if not ok then return end

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}
local org_maps = {
  o = {
    name = "+org",
    ['<TAB>'] = { function() orgmode.action("org_mappings.toggle_checkbox") end, 'toggle checkbox' }
  },
}
wk.register(org_maps, opts)
