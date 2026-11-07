# sysfetch

一个 fastfetch 风格的系统信息展示工具：左边显示你的 Logo/头像（彩色字符块，任何终端可用，
支持 kitty 图形协议的终端自动切换高清模式），右边显示完整的系统信息。

## 功能

- 显示：OS、主机型号、内核、运行时间、软件包数、Shell、桌面环境、窗口管理器、
  分辨率、终端、CPU、GPU、内存、磁盘、电池、本机 IP、语言环境、时间，以及彩色块
- 配置文件驱动（conf.txt），可换成任意 PNG/JPG 头像或文本 ASCII 画
- 自动检测终端能力：kitty/WezTerm/Ghostty 用高清图形协议；其他终端自动用彩色字符块

## 安装

```bash
git clone https://github.com/AzenDev2026/<仓库名>.git   # 或网页下载解压
cd <仓库名>
./install.sh
source ~/.bashrc    # 或者直接新开一个终端
sysfetch
```

安装位置：
- 命令：`~/.local/bin/sysfetch`
- 资源：`~/.local/share/sysfetch/`（conf.txt、ascii.txt、nvazen.png）

## 自定义

把 `~/.local/share/sysfetch/conf.txt` 复制到 `~/.config/sysfetch/conf.txt` 再修改：

```
{ascii-logo} : blue
/path/to/your/avatar.png     # 换成你自己的图片（绝对路径）或 ascii.txt

{sys-info} :
/etc/os-release
```

改完直接运行 `sysfetch` 生效。卸载：`./uninstall.sh`

## 开发

- 直接运行仓库里的脚本即可（自动使用 assets/conf.txt）
- 测试输出布局：`script -qec "python3 sysfetch" /dev/null` 配合 pyte 渲染
