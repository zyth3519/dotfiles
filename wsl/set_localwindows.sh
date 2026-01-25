#!/bin/bash
# ========== HOSTALIASES 自动配置（用户级） ==========
function auto_config_hostaliases() {
  # 1. 定义映射文件路径和自定义域名
  local HOSTS_FILE="/etc/hosts"
  local DOMAIN="localwindows" # 你要映射的域名

  # 2. 自动获取 Windows 主机 IPv4 地址
  local WIN_IP=$(ip route show | grep -i default | awk '{ print $3}')

  # 3. 清理旧映射（避免重复条目）
  sed -i "/.*$DOMAIN$/d" "$HOSTS_FILE" # 仅删除以 $DOMAIN 开头的行

  # 4. 写入新映射（格式：域名 IP）
  if [ -n "$WIN_IP" ]; then
    echo "$WIN_IP $DOMAIN" >>"$HOSTS_FILE"
  else
    echo "[HOSTALIASES] 失败: 未获取到 Windows IP"
  fi
}

# 终端启动时自动执行
auto_config_hostaliases
