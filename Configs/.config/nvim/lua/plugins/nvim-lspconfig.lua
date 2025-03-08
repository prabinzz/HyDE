return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      -- Go
      gopls = {
        settings = {
          gopls = {
            usePlaceholders = false,
            completeUnimported = true,
          },
        },
      },
      -- Python (pyright)
      pyright = {
        settings = {
          pyright = {
            usePlaceholders = false,
          },
        },
      },
      -- C/C++ (clangd)
      clangd = {
        cmd = {
          "clangd",
          "--clang-tidy",
          "--completion-style=detailed",
          "--function-arg-placeholders=false", -- Disable placeholders directly via command line flags
        },
      }, -- JavaScript/TypeScript (tsserver)
      tsserver = {
        settings = {
          javascript = {
            usePlaceholders = false,
          },
          typescript = {
            usePlaceholders = false,
          },
        },
      },
      -- Rust (rust_analyzer)
      rust_analyzer = {
        settings = {
          rust = {
            usePlaceholders = false,
          },
        },
      },
      -- Lua (sumneko_lua)
      sumneko_lua = {
        settings = {
          Lua = {
            usePlaceholders = false,
          },
        },
      },
      -- Java (jdtls)
      jdtls = {
        settings = {
          java = {
            usePlaceholders = false,
          },
        },
      },
      -- HTML (html)
      html = {
        settings = {
          html = {
            usePlaceholders = false,
          },
        },
      },
      -- CSS (cssls)
      cssls = {
        settings = {
          css = {
            usePlaceholders = false,
          },
        },
      },
      -- PHP (intelephense)
      intelephense = {
        settings = {
          intelephense = {
            usePlaceholders = false,
          },
        },
      },
    },
  },
}
