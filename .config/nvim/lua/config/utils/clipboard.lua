-- lua/config/utils/clipboard.lua
local M = {}

function M.setup()
  local display_server = os.getenv("XDG_SESSION_TYPE") or ""
  
  if display_server:lower() == "wayland" then
    vim.g.clipboard = {
      name = "wl-clipboard",
      copy = {
        ["+"] = "wl-copy --foreground --type text/plain",
        ["*"] = "wl-copy --foreground --type text/plain",
      },
      paste = {
        ["+"] = "wl-paste --no-newline",
        ["*"] = "wl-paste --no-newline",
      },
      cache_enabled = true,
    }
  else -- Default to X11 behavior
    vim.g.clipboard = {
      name = "xsel",
      copy = {
        ["+"] = "xsel --clipboard --input",
        ["*"] = "xsel --clipboard --input",
      },
      paste = {
        ["+"] = "xsel --clipboard --output",
        ["*"] = "xsel --clipboard --output",
      },
      cache_enabled = true,
    }
  end
end

return M
