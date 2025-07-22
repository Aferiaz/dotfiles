    local my_fqbn = {
      ["/home/andreas/Arduino/esp32c3/"] = "esp32:esp32:esp32c3",
      ["/home/andreas/Arduino/esp32s3/"] = "esp32:esp32:esp32s3",
    }
    local default_fqbn = "esp32:esp32:esp32c3"
    -- local fqbn = my_fqbn[]
    -- local function find_arduino_root()
    --   local buf_path = vim.api.nvim_buf_get_name(0)
    --   if buf_path == "" then return nil end
    --   local current_dir = vim.fn.fnamemodify(buf_path, ":p:h")
    --   while current_dir ~= "/" do
    --     local root_marker = current_dir .. "/root.arduino"
    --     if vim.fn.filereadable(root_marker) == 1 then
    --       return current_dir
    --     end
    --     current_dir = vim.fn.fnamemodify(current_dir, ":h")
    --   end
    -- end
    -- local function get_fqbn()
    --   local root_dir = find_arduino_root()
    --   if not root_dir then return default_fqbn end
    --   local parent_folder = vim.fn.fnamemodify(root_dir, ":t")
    --   return my_fqbn[parent_folder] or default_fqbn
    -- end

    local function get_fqbn()
      local buf_path = vim.api.nvim_buf_get_name(0)
      for path, fqbn in pairs(my_fqbn) do
        if buf_path:find(path, 1, true) then
          return fqbn
        end
      end
      return default_fqbn
    end

return {
  --NOTE: This is the fix described in the github issue:
  --      https://github.com/arduino/arduino-language-server/issues/206
  capabilities = {
    textDocument = {
      semanticTokens = vim.NIL,
    },
    workspace = {
      semanticTokens = vim.NIL,
    },
  },
  cmd = {
    "/home/andreas/go/bin/arduino-language-server",
    "--clangd", "/usr/bin/clangd",
    -- "--fqbn", "esp32:esp32:esp32c3"
    "--fqbn", get_fqbn()
  },
  filetypes = {
    "arduino",
  },
  root_markers = {
    "root.arduino"
  },
  -- log_level = vim.lsp.protocol.MessageType.Warning,
}
