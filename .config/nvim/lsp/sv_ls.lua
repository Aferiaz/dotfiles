return {
  cmd = {
    "verible-verilog-ls",
    "--rules_config_search",
  },
  filetypes = {
    "systemverilog",
    "verilog",
    "sv"
  },
  root_markers = {
    "verible.filelist"
  },
  log_level = vim.lsp.protocol.MessageType.Warning,
}
