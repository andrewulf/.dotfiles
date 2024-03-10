local lspcfg = function()
  local mason_lspconfig = require('mason-lspconfig')
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint(bufnr, true)
      vim.g.inlay_hints_visible = true
    end
  end

  require("mason").setup()
  -- Setup neovim lua configuration with neodev
  require('neodev').setup()

  local servers = {
    asm_lsp = {},
    java_language_server = {},
    angularls = {},
    vimtex = {},
    ocamllsp = {},
    python = {},
    eslint = {
      file_types = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "vue",
        "svelte", "astro"
      },
      settings = {
        codeAction = {
          disableRuleComment = {
            enable = true,
            location = "separateLine"
          },
          showDocumentation = {
            enable = true
          }
        },
        codeActionOnSave = {
          enable = false,
          mode = "all"
        },
        experimental = {
          useFlatConfig = false
        },
        format = false,
        nodePath = "",
        onIgnoredFiles = "off",
        packageManager = "npm",
        problems = {
          shortenToSingleLine = false
        },
        quiet = false,
        rulesCustomizations = {},
        run = "onType",
        useESLintClass = false,
        validate = "on",
        workingDirectory = {
          mode = "location"
        }
      }
    },
    gopls = {
      cmd = { "gopls", "serve" },
      settings = {
        gopls = {
          gofumpt = true,
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          linksInHover = false,
          codelenses = {
            generate = true,
            gc_details = true,
            regenerate_cgo = true,
            tidy = true,
            upgrade_depdendency = true,
            vendor = true,
          },
          usePlaceholders = true,
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true
          }
        },
      },
    },
    tsserver = {
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          }
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          }
        }
      }
    },
    html = { filetypes = { 'html', 'twig', 'hbs' } },
    lua_ls = {
      Lua = {
        format = {
          enable = true,
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
          }
        },
        diagnostics = {
          globals = { 'vim' }
        },
        hint = {
          enable = true
        }
      }
    },
    cssls = {
      cmd = { "vscode-css-language-server", "--stdio" },
      root_dir = require('lspconfig/util').root_pattern("package.json", ".git"),
      init_options = {
        provideFormatter = true,
      },
      filetypes = { "css", "scss", "less" },
      settings = {
        css = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        scss = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        less = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    }
  }

  require('lspconfig').clangd.setup {
    cmd = { "clangd" },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'proto', 'cuda' },
  }



  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
  }

  mason_lspconfig.setup_handlers {
    function(server_name)
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
      }
    end
  }

  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  vim.diagnostic.config({
    virtual_text = true,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      -- focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })
end

return {
  "williamboman/mason.nvim",
  dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
  config = lspcfg
}
