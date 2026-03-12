return {
  cmd = { vim.fn.expand('~/go/bin/jsonnet-language-server'), '--lint' },
  filetypes = { 'jsonnet', 'libsonnet' },
  root_markers = { '.git' },
}
