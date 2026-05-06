return {
  filetypes = { 'lua' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = {
        preloadFileSize = 10000,
        library = {
          vim.env.VIMRUNTIME,
        }
      },
      formatters = {
        ignoreComments = true,
      },
      signatureHelp = { enabled = true },
      diagnostics = {
        globals = { "nixCats", "vim", },
        disable = { 'missing-fields' },
      },
      telemetry = { enabled = false },
    },
  },
}

