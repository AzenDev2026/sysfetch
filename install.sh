#!/usr/bin/env bash
# sysfetch 安装脚本
# 将 sysfetch 命令安装到 ~/.local/bin，资源安装到 ~/.local/share/sysfetch
# 用法: ./install.sh   （如需自定义前缀: SYSFETCH_BIN=/path SYSFETCH_DATA=/path ./install.sh）
set -e

BIN_DIR="${SYSFETCH_BIN:-$HOME/.local/bin}"
DATA_DIR="${SYSFETCH_DATA:-$HOME/.local/share/sysfetch}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> 安装 sysfetch"
echo "    命令目录: $BIN_DIR"
echo "    资源目录: $DATA_DIR"

mkdir -p "$BIN_DIR" "$DATA_DIR"

install -m 0755 "$SCRIPT_DIR/sysfetch" "$BIN_DIR/sysfetch"
install -m 0644 "$SCRIPT_DIR/assets/conf.txt" "$DATA_DIR/conf.txt"
install -m 0644 "$SCRIPT_DIR/assets/ascii.txt" "$DATA_DIR/ascii.txt"
install -m 0644 "$SCRIPT_DIR/assets/nvazen.png" "$DATA_DIR/nvazen.png"

# 检查 PATH 是否包含安装目录
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo "==> $BIN_DIR 不在 PATH 中，尝试写入 shell 配置"
    wrote=0
    for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
        if [[ -f "$rc" ]] && ! grep -qF "$BIN_DIR" "$rc" 2>/dev/null; then
            printf '\n# sysfetch\nexport PATH="%s:$PATH"\n' "$BIN_DIR" >> "$rc"
            echo "    已写入 $rc"
            wrote=1
        fi
    done
    if [[ $wrote -eq 0 ]]; then
        echo "    未找到可写的 shell 配置，请手动把 $BIN_DIR 加入 PATH"
    fi
fi

echo ""
echo "✅ 安装完成！"
echo "   - 新开一个终端（或执行 source ~/.bashrc）后，直接输入 sysfetch 即可启动"
echo "   - 想自定义配置: 把 $DATA_DIR/conf.txt 复制到 ~/.config/sysfetch/conf.txt 再修改"
echo "   - 卸载: 运行 $SCRIPT_DIR/uninstall.sh"
