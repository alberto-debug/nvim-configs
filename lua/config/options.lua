local opt = vim.opt

-- Indentation & Whitespace --------------------------
opt.expandtab = true -- Convert tabs to spaces
opt.tabstop = 2 -- Number of spaces a tab counts for
opt.shiftwidth = 2 -- Number of spaces inserted for indentation
opt.softtabstop = 2 -- Number of spaces a tab counts for while editing
opt.smartindent = true -- Insert indents automatically
opt.wrap = false -- Disable line wrapping
opt.list = true -- Show invisible characters
opt.listchars = { -- Define invisible character appearance
  tab = '» ', -- Tab characters
  trail = '·', -- Trailing spaces
  extends = '›', -- Character shown when line extends right
  precedes = '‹', -- Character shown when line extends left
}

-- Search ------------------------------------------
opt.incsearch = true  -- Show search matches as you type
opt.ignorecase = true -- Case-insensitive search
opt.smartcase = true  -- Case-sensitive if search has uppercase
opt.hlsearch = false  -- Don't highlight search results

-- Appearance -------------------------------------
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.relativenumber = true -- Show relative line numbers
opt.number = true -- Show current line number
opt.signcolumn = "yes" -- Always show sign column
opt.cmdheight = 1 -- Command line height
opt.scrolloff = 10 -- Lines of context when scrolling
opt.sidescrolloff = 8 -- Columns of context when scrolling
opt.showmode = false -- Don't show mode in command line
opt.cursorline = true -- Highlight current line
opt.fillchars = { -- Characters used for separators
  vert = '│', -- Vertical separators
  fold = '·', -- Folding guide
  eob = ' ', -- Empty lines at end of buffer
}

-- Completion ------------------------------------
opt.completeopt = "menuone,noinsert,noselect"
opt.pumheight = 10 -- Maximum items in popup menu

-- Behavior --------------------------------------
opt.hidden = true      -- Allow switching buffers without saving
opt.errorbells = false -- Disable error bells
opt.swapfile = false   -- Don't create swap files
opt.backup = false     -- Don't create backup files
opt.undofile = true    -- Enable persistent undo
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.backspace = "indent,eol,start"
opt.splitright = true         -- Open vertical splits to the right
opt.splitbelow = true         -- Open horizontal splits below
opt.autochdir = false         -- Don't change directory automatically
opt.mouse = "a"               -- Enable mouse in all modes
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.modifiable = true         -- Allow buffer modifications
opt.encoding = "UTF-8"        -- Set default encoding

-- File-specific Settings ------------------------
opt.conceallevel = 2 -- Hide markup in markdown files

-- Window Behavior ------------------------------
opt.winblend = 0        -- Window transparency (0-100)
opt.wildoptions = "pum" -- Use popup menu for completions
opt.pumblend = 5        -- Popup menu transparency

-- File Management -----------------------------
opt.autowrite = true -- Auto save before commands like :next
opt.autoread = true  -- Auto reload changed files

-- Add visual feedback for errors instead of bells
opt.visualbell = true

--obsidian
opt.conceallevel = 2
