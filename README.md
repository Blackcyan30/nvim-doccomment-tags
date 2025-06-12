# nvim-doccomment-tags

A lightweight Neovim plugin to highlight Doxygen/Javadoc-style tags within your code comments.

## ✨ Features

- Highlights common documentation tags like `@param`, `@return`, `@brief`, etc.
- Works within single-line (`//`), multi-line (`/* ... */`), and block (`*`) comments.
- Configurable highlight group to match your colorscheme.
- Extensible list of tags.

## 🚀 Installation

Using `lazy.nvim` (recommended):

```lua
-- plugins/doccomment-tags.lua
return {
<<<<<<< HEAD
  "Blackcyan30/nvim-doccomment-tags", -- Replace with your GitHub username and repository name
=======
  "your-github-username/nvim-doccomment-tags", -- Replace with your GitHub username and repository name
>>>>>>> 324163d84c1e3491cbaeea8846e419a62fcd2e4e
  config = function()
    require("nvim-doccomment-tags.doccomment_tags").setup({
      -- Your optional configurations here
      -- tags = { "@mycustomtag", "@othertag" },
      -- hl_group = "Comment", -- Use the Comment highlight group
    })
  end,
}
```

<<<<<<< HEAD

## 💡 Usage

# The plugin automatically highlights recognized tags within comments when you open a buffer or make changes.

Remember to replace `your-github-username` and `nvim-doccomment-tags` with your actual GitHub username and repository name after you push it to GitHub.

## 💡 Usage

The plugin automatically highlights recognized tags within comments when you open a buffer or make changes.

## ⚙️ Configuration

You can pass a table to the `setup()` function to customize the plugin:

```lua
require("nvim-doccomment-tags.doccomment_tags").setup({
  -- List of tags to highlight. By default, it uses a comprehensive list of Doxygen/Javadoc tags.
  tags = {
    "@param", "@return", "@example", "@todo", "@note", -- Add or remove tags as needed
  },
  -- Highlight group to use for the tags. Defaults to "Special".
  -- You can link it to an existing highlight group (e.g., "Comment", "Identifier", "Function")
  -- or define your own.
  hl_group = "DiagnosticWarn", -- Example: use the highlight for warnings
})
```

## 🤝 Contributing

Contributions are welcome! If you have ideas for improvements, new features, or find any bugs, please feel free to open an issue or submit a pull request. I will review it on my own time and get back to you.

> > > > > > > 324163d84c1e3491cbaeea8846e419a62fcd2e4e

## ⚙️ Configuration

You can pass a table to the `setup()` function to customize the plugin:

```lua
require("nvim-doccomment-tags.doccomment_tags").setup({
  -- List of tags to highlight. By default, it uses a comprehensive list of Doxygen/Javadoc tags.
  tags = {
    "@param", "@return", "@example", "@todo", "@note", -- Add or remove tags as needed
  },
  -- Highlight group to use for the tags. Defaults to "Special".
  -- You can link it to an existing highlight group (e.g., "Comment", "Identifier", "Function")
  -- or define your own.
  hl_group = "DiagnosticWarn", -- Example: use the highlight for warnings
})
```

## 🤝 Contributing

Contributions are welcome! If you have ideas for improvements, new features, or find any bugs, please feel free to open an issue or submit a pull request. I will review it on my own time and get back to you.

## 📄 License

This plugin is licensed under the Apache 2.0 License. See the `LICENSE` file for more details.
