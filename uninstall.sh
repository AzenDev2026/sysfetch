#!/usr/bin/env bash
# sysfetch 卸载脚本
set -e

BIN_DIR="${SYSFETCH_BIN:-$HOME/.local/bin}"
DATA_DIR="${SYSFETCH_DATA:-$HOME/.local/share/sysfetch}"

echo "==> 卸载 sysfetch"
rm -f "$BIN_DIR/sysfetch"
rm -rf "$DATA_DIR"

# 从 shell 配置里移除 PATH 行
for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
    if [[ -f "$rc" ]]; then
        sed -i '/# sysfetch/d;/export PATH=".*\.local\/bin:\$PATH"/d' "$rc"
    fi
done

echo "✅ 已卸载（~/.config/sysfetch/ 下的自定义配置保留，如不需要可手动删除）"
