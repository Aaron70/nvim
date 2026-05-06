local function find_latest_lombok_gradle_caches() 

  -- Dynamically find latest from Gradle cache
  local jars = vim.fn.glob(
    vim.fn.expand('~') .. '/.gradle/caches/modules-2/files-2.1/org.projectlombok/lombok/**/*.jar',
    false, true
  )

  -- Filter out non-lombok jars (mapstruct-binding, sources, etc.)
  jars = vim.tbl_filter(function(p)
    return p:match('/lombok%-%d') and not p:match('sources')
  end, jars)

  if #jars == 0 then return nil end

  -- Sort so the highest version ends up last
  table.sort(jars)
  return jars[#jars]
end

local function find_lombok()
  -- Here you can add other ways to find lombok
  -- Currently this works for the work mac
  return find_latest_lombok_gradle_caches()
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.expand('~/.cache/jdtls/workspace/') .. project_name

local lombok_jar  = find_lombok()
local cmd = {
  "jdtls",
  "-data", workspace_dir,
}

if lombok_jar then
  table.insert(cmd, "--jvm-arg=-javaagent:" .. lombok_jar)
end

return {
  cmd = cmd,
  settings = {
    java = {
      import = {
        gradle = {
          enabled = true,
          wrapper = { enabled = true },
        },
      },
      gradle = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
      },
      sources = {
        downloadSources = true,
      },
    },
  },
}
