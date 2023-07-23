# coc

- coc-json
- coc-pairs
- coc-tsserver

vim/markdown 类型文件需要安装 `efm-langserver`

# fzf

需要安装 `rg`

插件推荐使用`fd`，会自动读取 git 仓库中的 `.gitignore` 文件

配置方法

```sh
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND
```

# 其他

`update_git.sh` 可以将配置文件复制到 git 文件夹下，来更新 git 仓库

wsl 环境下使用剪贴板，请将 wsl 文件夹下的 `win32yank.exe` 放置 windows `PATH` 环境变量中
