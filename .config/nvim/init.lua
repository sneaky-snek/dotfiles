require("config.lazy")

vim.g.clipboard = {
  name = "dms-clipboard",
  copy = {
    ["+"] = "dms cl copy",
    ["*"] = "dms cl copy",
  },
  paste = {
    ["+"] = "dms cl paste",
    ["*"] = "dms cl paste",
  },
  cache_enabled = 0,
}

vim.opt.clipboard = "unnamedplus"
