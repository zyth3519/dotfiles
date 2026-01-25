# WSL fish 自动启动 tmux（优化版，保留你的核心逻辑）
if status is-interactive          # 确认是交互式终端（fish 原生判断，比 $fish_version 更准确）
    and not set -q TMUX           # 确认不在 tmux 中（防嵌套）
    and set -q WSL_DISTRO_NAME    # 仅在 WSL 环境生效（避免其他系统误触发）
    # 优化点1：去掉 exec 避免退出 tmux 时直接关闭终端
    # 优化点2：2>/dev/null 静默无会话时的报错（WSL 终端更友好）
    tmux attach-session -t default 2>/dev/null; or tmux new-session -s default

    # Commands to run in interactive sessions can go here
    source "$HOME/.cargo/env.fish"
end

alias cls=clear
alias yay=paru
alias vim=nvim
set -x PATH .config/emacs/bin/ $PATH
