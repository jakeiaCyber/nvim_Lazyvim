if not vim.g.vscode then
  return {}
end

local enabled = {
  "LazyVim",
  "dial.nvim",
  "flit.nvim",
  "lazy.nvim",
  "leap.nvim",
  "mini.ai",
  "mini.comment",
  "mini.move",
  "mini.pairs",
  "mini.surround",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "snacks.nvim",
  "ts-comments.nvim",
  "vim-repeat",
  "yanky.nvim",
}

local Config = require("lazy.core.config")
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end

-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymapsDefaults",
  callback = function()
    vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
    vim.keymap.set("n", "<leader>/", [[<cmd>lua require('vscode').action('workbench.action.findInFiles')<cr>]])
    vim.keymap.set("n", "<leader>ss", [[<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<cr>]])

    -- 基本操作
    vim.keymap.set("n", "<Leader>w", [[<cmd>lua require('vscode').action('workbench.action.files.save')<cr>]])

    -- 分屏导航
    vim.keymap.set("n", "\\", [[<cmd>lua require('vscode').action('workbench.action.splitEditor')<cr>]])
    vim.keymap.set("n", "|", [[<cmd>lua require('vscode').action('workbench.action.splitEditorDown')<cr>]])
    vim.keymap.set("n", "<C-H>", [[<cmd>lua require('vscode').action('workbench.action.navigateLeft')<cr>]])
    vim.keymap.set("n", "<C-J>", [[<cmd>lua require('vscode').action('workbench.action.navigateDown')<cr>]])
    vim.keymap.set("n", "<C-K>", [[<cmd>lua require('vscode').action('workbench.action.navigateUp')<cr>]])
    vim.keymap.set("n", "<C-L>", [[<cmd>lua require('vscode').action('workbench.action.navigateRight')<cr>]])

    -- 终端
    vim.keymap.set("n", "<F7>", [[<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<cr>]])
    vim.keymap.set("n", "<C-'>", [[<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<cr>]])

    -- 缓冲区管理
    vim.keymap.set("n", "<Tab>", "<Cmd>Tabnext<CR>")
    vim.keymap.set("n", "<S-Tab>", "<Cmd>Tabprevious<CR>")
    vim.keymap.set("n", "<Leader>q", "<Cmd>Tabclose<CR>")

    -- 文件浏览器
    vim.keymap.set(
      "n",
      "<Leader>e",
      [[<cmd>lua require('vscode').action('workbench.files.action.focusFilesExplorer')<cr>]]
    )
    vim.keymap.set(
      "n",
      "<Leader>o",
      [[<cmd>lua require('vscode').action('workbench.files.action.focusFilesExplorer')<cr>]]
    )

    -- 缩进
    vim.keymap.set("v", "<Tab>", [[<cmd>lua require('vscode').action('editor.action.indentLines')<cr>]])
    vim.keymap.set("v", "<S-Tab>", [[<cmd>lua require('vscode').action('editor.action.outdentLines')<cr>]])

    -- 诊断
    vim.keymap.set("n", "]d", [[<cmd>lua require('vscode').action('editor.action.marker.nextInFiles')<cr>]])
    vim.keymap.set("n", "[d", [[<cmd>lua require('vscode').action('editor.action.marker.prevInFiles')<cr>]])

    -- 选择器
    vim.keymap.set(
      "n",
      "<Leader>fc",
      [[<cmd>lua require('vscode').action('workbench.action.findInFiles', { args = { query = vim.fn.expand("<cword>") } })<cr>]]
    )
    vim.keymap.set("n", "<Leader>fp", [[<cmd>lua require('vscode').action('workbench.action.showCommands')<cr>]])
    vim.keymap.set("n", "<Leader>ff", [[<cmd>lua require('vscode').action('workbench.action.quickOpen')<cr>]])
    vim.keymap.set("n", "<Leader>fn", [[<cmd>lua require('vscode').action('notifications.showList')<cr>]])
    vim.keymap.set("n", "<Leader>fo", [[<cmd>lua require('vscode').action('workbench.action.openRecent')<cr>]])
    vim.keymap.set("n", "<Leader>ft", [[<cmd>lua require('vscode').action('workbench.action.selectTheme')<cr>]])
    vim.keymap.set("n", "<Leader>fw", [[<cmd>lua require('vscode').action('workbench.action.quickTextSearch')<cr>]])

    -- Git
    vim.keymap.set("n", "<Leader>gg", [[<cmd>lua require('vscode').action('workbench.view.scm')<cr>]])

    -- LSP 映射
    vim.keymap.set("n", "K", [[<cmd>lua require('vscode').action('editor.action.showHover')<cr>]])
    vim.keymap.set("n", "gI", [[<cmd>lua require('vscode').action('editor.action.goToImplementation')<cr>]])
    vim.keymap.set("n", "gd", [[<cmd>lua require('vscode').action('editor.action.revealDefinition')<cr>]])
    vim.keymap.set("n", "gD", [[<cmd>lua require('vscode').action('editor.action.revealDeclaration')<cr>]])
    vim.keymap.set("n", "gr", [[<cmd>lua require('vscode').action('editor.action.goToReferences')<cr>]])
    vim.keymap.set("n", "gy", [[<cmd>lua require('vscode').action('editor.action.goToTypeDefinition')<cr>]])
    vim.keymap.set("n", "<Leader>la", [[<cmd>lua require('vscode').action('editor.action.quickFix')<cr>]])
    vim.keymap.set("n", "<Leader>lG", [[<cmd>lua require('vscode').action('workbench.action.showAllSymbols')<cr>]])
    vim.keymap.set("n", "<Leader>lR", [[<cmd>lua require('vscode').action('editor.action.goToReferences')<cr>]])
    vim.keymap.set("n", "<Leader>lr", [[<cmd>lua require('vscode').action('editor.action.rename')<cr>]])
    vim.keymap.set("n", "<Leader>ls", [[<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<cr>]])
    vim.keymap.set("n", "<Leader>lf", [[<cmd>lua require('vscode').action('editor.action.formatDocument')<cr>]])

    -- 项目管理
    vim.keymap.set("n", "<Leader>pa", [[<cmd>lua require('vscode').action('projectManager.saveProject')<cr>]])
    vim.keymap.set("n", "<Leader>po", [[<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<cr>]])
    vim.keymap.set("n", "<Leader>pe", [[<cmd>lua require('vscode').action('projectManager.editProjects')<cr>]])

    -- 添加文件
    vim.keymap.set("n", "<Leader>na", [[<cmd>lua require('vscode').action('dynoFileUtils.newItems')<cr>]])
  end,
})

return {
  {
    "LazyVim/LazyVim",
    config = function(_, opts)
      opts = opts or {}
      -- disable the colorscheme
      opts.colorscheme = function() end
      require("lazyvim").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
}
