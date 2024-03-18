return {
  "quarto-dev/quarto-nvim",
  dependencies = {
    {
      "jmbuhr/otter.nvim",
      opts = {
        buffers = {
          set_filetype = true,
        },
        handle_leading_whitespace = true,
      },
    },
  },
  opts = {
    debug = false,
    closePreviewOnExit = true,
    lspFeatures = {
      enabled = true,
      chunks = "curly",
      languages = { "r", "python", "julia", "bash", "html", "php" },
      diagnostics = {
        enabled = true,
        triggers = { "BufWritePost" },
      },
      completion = {
        enabled = true,
      },
    },
    codeRunner = {
      enabled = true,
      default_method = "slime", -- 'molten' or 'slime'
      ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
      -- Takes precedence over `default_method`
      never_run = { "yaml" }, -- filetypes which are never sent to a code runner
    },
    -- keymap = false,
    keymap = {
      -- set whole section or individual keys to `false` to disable
      hover = "K",
      definition = "gd",
      type_definition = "gD",
      rename = "<leader>lR",
      format = "<leader>lf",
      references = "gr",
      document_symbols = "gS",
    },
  },

  --{
  --  'nvim-treesitter/nvim-treesitter',
  --  dependencies = {
  --    { 'nvim-treesitter/nvim-treesitter-textobjects' },
  --  },
  --  run = ':TSUpdate',
  --  config = function()
  --    ---@diagnostic disable-next-line: missing-fields
  --    require('nvim-treesitter.configs').setup {
  --      auto_install = true,
  --      ensure_installed = {
  --        'r',
  --        'python',
  --        'markdown',
  --        'markdown_inline',
  --        'julia',
  --        'bash',
  --        'yaml',
  --        'lua',
  --        'vim',
  --        'query',
  --        'vimdoc',
  --        'latex',
  --        'html',
  --        'css',
  --        'dot',
  --        'javascript',
  --        'mermaid',
  --        'norg',
  --        'typescript',
  --      },
  --      highlight = {
  --        enable = true,
  --        additional_vim_regex_highlighting = false,
  --      },
  --      indent = {
  --        enable = true,
  --      },
  --      incremental_selection = {
  --        enable = true,
  --        keymaps = {
  --          init_selection = 'gnn',
  --          node_incremental = 'grn',
  --          scope_incremental = 'grc',
  --          node_decremental = 'grm',
  --        },
  --      },
  --      textobjects = {
  --        select = {
  --          enable = true,
  --          lookahead = true,
  --          keymaps = {
  --            -- You can use the capture groups defined in textobjects.scm
  --            ['af'] = '@function.outer',
  --            ['if'] = '@function.inner',
  --            ['ac'] = '@class.outer',
  --            ['ic'] = '@class.inner',
  --          },
  --        },
  --        move = {
  --          enable = true,
  --          set_jumps = true, -- whether to set jumps in the jumplist
  --          goto_next_start = {
  --            [']m'] = '@function.outer',
  --            [']]'] = '@class.inner',
  --          },
  --          goto_next_end = {
  --            [']M'] = '@function.outer',
  --            [']['] = '@class.outer',
  --          },
  --          goto_previous_start = {
  --            ['[m'] = '@function.outer',
  --            ['[['] = '@class.inner',
  --          },
  --          goto_previous_end = {
  --            ['[M'] = '@function.outer',
  --            ['[]'] = '@class.outer',
  --          },
  --        },
  --      },
  --    }
  --  end,
  --},

  --{
  --  'neovim/nvim-lspconfig',
  --  dependencies = {
  --    { 'williamboman/mason.nvim' },
  --    { 'williamboman/mason-lspconfig.nvim' },
  --    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
  --    { -- nice loading notifications
  --      -- PERF: but can slow down startup
  --      'j-hui/fidget.nvim',
  --      enabled = false,
  --      opts = {},
  --    },
  --    { 'folke/neodev.nvim', opts = {}, enabled = true },
  --    { 'folke/neoconf.nvim', opts = {}, enabled = false },
  --  },
  --  config = function()
  --    local lspconfig = require 'lspconfig'
  --    local util = require 'lspconfig.util'

  --    vim.api.nvim_create_autocmd('LspAttach', {
  --      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  --      callback = function(event)
  --        local telescope = require 'telescope.builtin'
  --        local function map(keys, func, desc)
  --          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
  --        end

  --        local client = vim.lsp.get_client_by_id(event.data.client_id)
  --        assert(client, 'LSP client not found')

  --        ---@diagnostic disable-next-line: inject-field
  --        client.server_capabilities.document_formatting = true

  --        map('gS', telescope.lsp_document_symbols, '[g]o so [S]ymbols')
  --        map('gD', telescope.lsp_type_definitions, '[g]o to type [D]efinition')
  --        map('gd', telescope.lsp_definitions, '[g]o to [d]efinition')
  --        map('K', '<cmd>lua vim.lsp.buf.hover()<CR>', '[K] hover documentation')
  --        map('gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', '[g]o to signature [h]elp')
  --        map('gI', telescope.lsp_implementations, '[g]o to [I]mplementation')
  --        map('gr', telescope.lsp_references, '[g]o to [r]eferences')
  --        map('[d', vim.diagnostic.goto_prev, 'previous [d]iagnostic ')
  --        map(']d', vim.diagnostic.goto_next, 'next [d]iagnostic ')
  --        map('<leader>ll', vim.lsp.codelens.run, '[l]ens run')
  --        map('<leader>lR', vim.lsp.buf.rename, '[l]sp [R]ename')
  --        map('<leader>lf', vim.lsp.buf.format, '[l]sp [f]ormat')
  --        map('<leader>lq', vim.diagnostic.setqflist, '[l]sp diagnostic [q]uickfix')
  --      end,
  --    })

  --    require('mason').setup()
  --    require('mason-lspconfig').setup {
  --      automatic_installation = true,
  --    }
  --    require('mason-tool-installer').setup {
  --      ensure_installed = {
  --        'black',
  --        'stylua',
  --        'shfmt',
  --        'isort',
  --      },
  --    }

  --    local lsp_flags = {
  --      allow_incremental_sync = true,
  --      debounce_text_changes = 150,
  --    }
  --    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = require('misc.style').border })
  --    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = require('misc.style').border })

  --    local capabilities = vim.lsp.protocol.make_client_capabilities()
  --    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
  --    capabilities.textDocument.completion.completionItem.snippetSupport = true

  --    -- also needs:
  --    -- $home/.config/marksman/config.toml :
  --    -- [core]
  --    -- markdown.file_extensions = ["md", "markdown", "qmd"]
  --    lspconfig.marksman.setup {
  --      capabilities = capabilities,
  --      filetypes = { 'markdown', 'quarto' },
  --      root_dir = util.root_pattern('.git', '.marksman.toml', '_quarto.yml'),
  --    }

  --    lspconfig.r_language_server.setup {
  --      capabilities = capabilities,
  --      flags = lsp_flags,
  --      settings = {
  --        r = {
  --          lsp = {
  --            rich_documentation = false,
  --          },
  --        },
  --      },
  --    }

  --    lspconfig.cssls.setup {
  --      capabilities = capabilities,
  --      flags = lsp_flags,
  --    }

  --    lspconfig.html.setup {
  --      capabilities = capabilities,
  --      flags = lsp_flags,
  --    }

  --    lspconfig.emmet_language_server.setup {
  --      capabilities = capabilities,
  --      flags = lsp_flags,
  --    }

  --    lspconfig.yamlls.setup {
  --      capabilities = capabilities,
  --      flags = lsp_flags,
  --      settings = {
  --        yaml = {
  --          schemaStore = {
  --            enable = true,
  --            url = '',
  --          },
  --        },
  --      },
  --    }

  --    lspconfig.dotls.setup {
  --      capabilities = capabilities,
  --      flags = lsp_flags,
  --    }

  --    lspconfig.tsserver.setup {
  --      capabilities = capabilities,
  --      flags = lsp_flags,
  --      filetypes = { 'js', 'javascript', 'typescript', 'ojs' },
  --    }

  --    local function get_quarto_resource_path()
  --      local function strsplit(s, delimiter)
  --        local result = {}
  --        for match in (s .. delimiter):gmatch('(.-)' .. delimiter) do
  --          table.insert(result, match)
  --        end
  --        return result
  --      end

  --      local f = assert(io.popen('quarto --paths', 'r'))
  --      local s = assert(f:read '*a')
  --      f:close()
  --      return strsplit(s, '\n')[2]
  --    end

  --    local lua_library_files = vim.api.nvim_get_runtime_file('', true)
  --    local lua_plugin_paths = {}
  --    local resource_path = get_quarto_resource_path()
  --    if resource_path == nil then
  --      vim.notify_once 'quarto not found, lua library files not loaded'
  --    else
  --      table.insert(lua_library_files, resource_path .. '/lua-types')
  --      table.insert(lua_plugin_paths, resource_path .. '/lua-plugin/plugin.lua')
  --    end

  --    lspconfig.lua_ls.setup {
  --      capabilities = capabilities,
  --      flags = lsp_flags,
  --      settings = {
  --        Lua = {
  --          completion = {
  --            callSnippet = 'Replace',
  --          },
  --          runtime = {
  --            version = 'LuaJIT',
  --            plugin = lua_plugin_paths,
  --          },
  --          diagnostics = {
  --            globals = { 'vim', 'quarto', 'pandoc', 'io', 'string', 'print', 'require', 'table' },
  --            disable = { 'trailing-space' },
  --          },
  --          workspace = {
  --            library = lua_library_files,
  --            checkThirdParty = false,
  --          },
  --          telemetry = {
  --            enable = false,
  --          },
  --        },
  --      },
  --    }

  --    lspconfig.julials.setup {
  --      capabilities = capabilities,
  --      flags = lsp_flags,
  --    }

  --    lspconfig.bashls.setup {
  --      capabilities = capabilities,
  --      flags = lsp_flags,
  --      filetypes = { 'sh', 'bash' },
  --    }

  --    -- Add additional languages here.
  --    -- See `:h lspconfig-all` for the configuration.
  --    -- Like e.g. Haskell:
  --    -- lspconfig.hls.setup {
  --    --   on_attach = on_attach,
  --    --   capabilities = capabilities,
  --    --   flags = lsp_flags
  --    -- }

  --    -- lspconfig.rust_analyzer.setup{
  --    --   on_attach = on_attach,
  --    --   capabilities = capabilities,
  --    --   settings = {
  --    --     ['rust-analyzer'] = {
  --    --       diagnostics = {
  --    --         enable = false;
  --    --       }
  --    --     }
  --    --   }
  --    -- }

  --    -- See https://github.com/neovim/neovim/issues/23291
  --    -- disable lsp watcher.
  --    -- Too lags on linux for python projects
  --    -- because pyright and nvim both create too many watchers otherwise
  --    if capabilities.workspace == nil then
  --      capabilities.workspace = {}
  --      capabilities.workspace.didChangeWatchedFiles = {}
  --    end
  --    capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

  --    lspconfig.pyright.setup {
  --      capabilities = capabilities,
  --      flags = lsp_flags,
  --      settings = {
  --        python = {
  --          analysis = {
  --            autoSearchPaths = true,
  --            useLibraryCodeForTypes = false,
  --            diagnosticMode = 'workspace',
  --          },
  --        },
  --      },
  --      root_dir = function(fname)
  --        return util.root_pattern('.git', 'setup.py', 'setup.cfg', 'pyproject.toml', 'requirements.txt')(fname) or util.path.dirname(fname)
  --      end,
  --    }
  --  end,
  --},

  -- { -- Autoformat
  --   'stevearc/conform.nvim',
  --   enabled = true,
  --   config = function()
  --     require('conform').setup {
  --       notify_on_error = false,
  --       format_on_save = {
  --         timeout_ms = 500,
  --         lsp_fallback = true,
  --       },
  --       formatters_by_ft = {
  --         lua = { 'mystylua' },
  --         python = { 'isort', 'black' },
  --       },
  --       formatters = {
  --         mystylua = {
  --           command = 'stylua',
  --           args = { '--indent-type', 'Spaces', '--indent-width', '2', '-' },
  --         },
  --       },
  --     }
  --     -- Customize the "injected" formatter
  --     require('conform').formatters.injected = {
  --       -- Set the options field
  --       options = {
  --         -- Set to true to ignore errors
  --         ignore_errors = false,
  --         -- Map of treesitter language to file extension
  --         -- A temporary file name with this extension will be generated during formatting
  --         -- because some formatters care about the filename.
  --         lang_to_ext = {
  --           bash = 'sh',
  --           c_sharp = 'cs',
  --           elixir = 'exs',
  --           javascript = 'js',
  --           julia = 'jl',
  --           latex = 'tex',
  --           markdown = 'md',
  --           python = 'py',
  --           ruby = 'rb',
  --           rust = 'rs',
  --           teal = 'tl',
  --           r = 'r',
  --           typescript = 'ts',
  --         },
  --         -- Map of treesitter language to formatters to use
  --         -- (defaults to the value from formatters_by_ft)
  --         lang_to_formatters = {},
  --       },
  --     }
  --   end,
  -- },

  -- completion
  --{
  --  'hrsh7th/nvim-cmp',
  --  event = 'InsertEnter',
  --  dependencies = {
  --    -- { 'hrsh7th/cmp-nvim-lsp' },
  --    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  --    { 'hrsh7th/cmp-buffer' },
  --    -- { 'hrsh7th/cmp-path' },
  --    { 'hrsh7th/cmp-calc' },
  --    { 'hrsh7th/cmp-emoji' },
  --    -- { 'saadparwaiz1/cmp_luasnip' },
  --    { 'f3fora/cmp-spell' },
  --    { 'ray-x/cmp-treesitter' },
  --    { 'kdheepak/cmp-latex-symbols' },
  --    { 'jmbuhr/cmp-pandoc-references' },
  --    -- { 'L3MON4D3/LuaSnip' },
  --    { 'rafamadriz/friendly-snippets' },
  --    { 'onsails/lspkind-nvim' },
  --  },
  --  config = function()
  --    local cmp = require 'cmp'
  --    local luasnip = require 'luasnip'
  --    local lspkind = require 'lspkind'

  --    local has_words_before = function()
  --      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
  --    end

  --    cmp.setup {
  --      snippet = {
  --        expand = function(args)
  --          luasnip.lsp_expand(args.body)
  --        end,
  --      },
  --      completion = { completeopt = 'menu,menuone,noinsert' },
  --      mapping = {
  --        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
  --        ['<C-d>'] = cmp.mapping.scroll_docs(4),

  --        ['<C-n>'] = cmp.mapping(function(fallback)
  --          if luasnip.expand_or_jumpable() then
  --            luasnip.expand_or_jump()
  --            fallback()
  --          end
  --        end, { 'i', 's' }),
  --        ['<C-p>'] = cmp.mapping(function(fallback)
  --          if luasnip.jumpable(-1) then
  --            luasnip.jump(-1)
  --          else
  --            fallback()
  --          end
  --        end, { 'i', 's' }),
  --        ['<C-e>'] = cmp.mapping.abort(),
  --        ['<c-y>'] = cmp.mapping.confirm {
  --          select = true,
  --        },
  --        ['<CR>'] = cmp.mapping.confirm {
  --          select = true,
  --        },

  --        ['<Tab>'] = cmp.mapping(function(fallback)
  --          if cmp.visible() then
  --            cmp.select_next_item()
  --          elseif has_words_before() then
  --            cmp.complete()
  --          else
  --            fallback()
  --          end
  --        end, { 'i', 's' }),
  --        ['<S-Tab>'] = cmp.mapping(function(fallback)
  --          if cmp.visible() then
  --            cmp.select_prev_item()
  --          else
  --            fallback()
  --          end
  --        end, { 'i', 's' }),

  --        ['<C-l>'] = cmp.mapping(function()
  --          if luasnip.expand_or_locally_jumpable() then
  --            luasnip.expand_or_jump()
  --          end
  --        end, { 'i', 's' }),
  --        ['<C-h>'] = cmp.mapping(function()
  --          if luasnip.locally_jumpable(-1) then
  --            luasnip.jump(-1)
  --          end
  --        end, { 'i', 's' }),
  --      },
  --      autocomplete = false,

  --      ---@diagnostic disable-next-line: missing-fields
  --      formatting = {
  --        format = lspkind.cmp_format {
  --          mode = 'symbol',
  --          menu = {
  --            otter = '[🦦]',
  --            nvim_lsp = '[LSP]',
  --            luasnip = '[snip]',
  --            buffer = '[buf]',
  --            path = '[path]',
  --            spell = '[spell]',
  --            pandoc_references = '[ref]',
  --            tags = '[tag]',
  --            treesitter = '[TS]',
  --            calc = '[calc]',
  --            latex_symbols = '[tex]',
  --            emoji = '[emoji]',
  --          },
  --        },
  --      },
  --      sources = {
  --        { name = 'otter' }, -- for code chunks in quarto
  --        { name = 'path' },
  --        { name = 'nvim_lsp' },
  --        { name = 'nvim_lsp_signature_help' },
  --        { name = 'luasnip', keyword_length = 3, max_item_count = 3 },
  --        { name = 'pandoc_references' },
  --        { name = 'buffer', keyword_length = 5, max_item_count = 3 },
  --        { name = 'spell' },
  --        { name = 'treesitter', keyword_length = 5, max_item_count = 3 },
  --        { name = 'calc' },
  --        { name = 'latex_symbols' },
  --        { name = 'emoji' },
  --      },
  --      view = {
  --        entries = 'native',
  --      },
  --      window = {
  --        documentation = {
  --          border = require('misc.style').border,
  --        },
  --      },
  --    }

  --    -- for friendly snippets
  --    require('luasnip.loaders.from_vscode').lazy_load()
  --    -- for custom snippets
  --    require('luasnip.loaders.from_vscode').lazy_load { paths = { vim.fn.stdpath 'config' .. '/snips' } }
  --    -- link quarto and rmarkdown to markdown snippets
  --    luasnip.filetype_extend('quarto', { 'markdown' })
  --    luasnip.filetype_extend('rmarkdown', { 'markdown' })
  --  end,
  --},

  -- send code from python/r/qmd documets to a terminal or REPL
  -- like ipython, R, bash
  -- {
  --   'jpalardy/vim-slime',
  --   init = function()
  --     vim.b['quarto_is_python_chunk'] = false
  --     Quarto_is_in_python_chunk = function()
  --       require('otter.tools.functions').is_otter_language_context 'python'
  --     end

  --     vim.cmd [[
  --     let g:slime_dispatch_ipython_pause = 100
  --     function SlimeOverride_EscapeText_quarto(text)
  --     call v:lua.Quarto_is_in_python_chunk()
  --     if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !(exists('b:quarto_is_r_mode') && b:quarto_is_r_mode)
  --     return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
  --     else
  --     if exists('b:quarto_is_r_mode') && b:quarto_is_r_mode && b:quarto_is_python_chunk
  --     return [a:text, "\n"]
  --     else
  --     return [a:text]
  --     end
  --     end
  --     endfunction
  --     ]]

  --     local function mark_terminal()
  --       vim.g.slime_last_channel = vim.b.terminal_job_id
  --       vim.print(vim.g.slime_last_channel)
  --     end

  --     local function set_terminal()
  --       vim.b.slime_config = { jobid = vim.g.slime_last_channel }
  --     end

  --     vim.g.slime_target = 'neovim'
  --     vim.g.slime_python_ipython = 1

  --     require('which-key').register {
  --       ['<leader>cm'] = { mark_terminal, 'mark terminal' },
  --       ['<leader>cs'] = { set_terminal, 'set terminal' },
  --     }
  --   end,
  -- },

  -- paste an image from the clipboard or drag-and-drop
  -- {
  --   'HakonHarnes/img-clip.nvim',
  --   event = 'BufEnter',
  --   opts = {
  --     filetypes = {
  --       markdown = {
  --         url_encode_path = true,
  --         template = '![$CURSOR]($FILE_PATH)',
  --         drag_and_drop = {
  --           download_images = false,
  --         },
  --       },
  --       quarto = {
  --         url_encode_path = true,
  --         template = '![$CURSOR]($FILE_PATH)',
  --         drag_and_drop = {
  --           download_images = false,
  --         },
  --       },
  --     },
  --   },
  -- },

  -- preview equations
  -- {
  --   'jbyuki/nabla.nvim',
  --   keys = {
  --     { '<leader>qm', ':lua require"nabla".toggle_virt()<cr>', desc = 'toggle [m]ath equations' },
  --   },
  -- },

  -- Might need this
  -- {
  --   'benlubas/molten-nvim',
  --   enabled = false,
  --   build = ':UpdateRemotePlugins',
  --   init = function()
  --     vim.g.molten_image_provider = 'image.nvim'
  --     vim.g.molten_output_win_max_height = 20
  --     vim.g.molten_auto_open_output = false
  --   end,
  --   keys = {
  --     { '<leader>mi', ':MoltenInit<cr>', desc = '[m]olten [i]nit' },
  --     {
  --       '<leader>mv',
  --       ':<C-u>MoltenEvaluateVisual<cr>',
  --       mode = 'v',
  --       desc = 'molten eval visual',
  --     },
  --     { '<leader>mr', ':MoltenReevaluateCell<cr>', desc = 'molten re-eval cell' },
  --   },
  -- },
}
