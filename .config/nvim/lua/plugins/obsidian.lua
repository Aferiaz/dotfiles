return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Notes",
          path = "~/Notes",
        },
      },
      completion = { 
        nvim_cmp = false,
        blink = true,
        min_chars = 2,
        create_new = true,
      },
      picker = {
        name = "snacks.pick",
        note_mappings = {
          new = "<C-x>",
          insert_link = "<C-l>",
        },
        tag_mappings = {
          tag_note = "<C-x>",
          insert_tag = "<C-l>",
        },
      },
      backlinks = {
        parse_headers = true,
      },
      ui = {
        enable = false,
      },
      sort_by = "modified",
      sort_reversed = true,
      daily_notes = {
        folder = "dailies",
      },
      footer = {
        enabled = true,
        format = "{{backlinks}} backlinks  {{properties}} properties  {{words}} words  {{chars}} chars",
        -- hl_group = "Comment",
        separator = string.rep("-", 3),
      },
    },
    keys = {
      {'<leader>ot', '<Cmd>Obsidian today<CR>', desc = "Create/Open Daily Note Today"},
      {'<leader>oy', '<Cmd>Obsidian yesterday<CR>', desc = "Create/Open Daily Note Yesterday"},
      {'<leader>ol', '<Cmd>Obsidian link<CR>', desc = "Create link"},
      -- TODO: Make this work like the new note
      {'<leader>oc', '<Cmd>Obsidian connect<CR>', desc = "Create a new note for the link"},
      {'<leader>op', '<Cmd>Obsidian paste_image<CR>', desc = "Paste Image"},
      {'<leader>os', '<Cmd>Obsidian search<CR>', desc = "Search Notes"},
      {'<leader>oq', '<Cmd>Obsidian tags<CR>', desc = "Search tags"},
      {'<leader>ob', '<Cmd>Obsidian backlinks<CR>', desc = "Note Backlinks"},
      {'<leader>ov', '<Cmd>Obsidian links<CR>', desc = "Note links"},
      {
        '<leader>on', 
        function()
          vim.ui.input({ prompt = "Note type (f = fleeting, m = main, r = reference): " }, function(short)
            local type_map = {
              f = "fleeting",
              m = "main",
              r = "reference",
            }
            
            local note_type = type_map[short]

            if not note_type then
              vim.notify("Invaild note type. Use f, m, or r.", vim.log.levels.ERROR)
              return
            end

            vim.ui.input({ prompt = "Note title: " }, function(title)
              local path = note_type .. "/" .. title
              vim.cmd("Obsidian new " .. path)

              vim.defer_fn(function()
                local bufnr = vim.api.nvim_get_current_buf()
                local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 20, false)
                local new_lines = {}
                local inside_frontmatter = false

                for i, line in ipairs(lines) do
                  if line:match("^%-%-%-") then
                    inside_frontmatter = not inside_frontmatter
                    table.insert(new_lines, line)
                  elseif inside_frontmatter and line:match("^tags:%s*%[.*%]") then
                    table.insert(new_lines, 'tags: [' .. note_type.. ']')
                  else
                    table.insert(new_lines, line)
                  end
                end
                vim.api.nvim_buf_set_lines(bufnr, 0, #new_lines, false, new_lines)
              end, 100)
            end)
          end)
        end,
        desc = "Create new Obsidian note"
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.icons' 
    },
    opts = {},
  },
}
