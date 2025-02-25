local jdtls = require "jdtls"
local data_path = vim.fn.stdpath("data")
local workspace_path = data_path .. "/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name
local mason_path = data_path .. "/mason"

local os_config = "linux"
if vim.fn.has "mac" == 1 then
  os_config = "mac"
elseif vim.fn.has "win" then
  os_config = "win"
end

local capabilities = require('blink.cmp').get_lsp_capabilities({})
local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
local configs = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:" .. mason_path .. "/packages/jdtls/lombok.jar",
    "-jar",
    vim.fn.glob(mason_path .. "/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    mason_path .. "/packages/jdtls/config_" .. os_config,
    "-data",
    workspace_dir,
  },
  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },
  capabilities = capabilities,

  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "temurin-17",
            path = "/home/aaronv/.sdkman/candidates/java/current",
          }
        },
      },
      maven = {
        downloadSources = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      format = {
        enabled = false,
      },
    },
    signatureHelp = { enabled = true },
    -- extendedClientCapabilities = extendedClientCapabilities,
  },
  -- init_options = {
  --   bundles = bundles,
  -- },
}

require "jdtls".start_or_attach(configs)
