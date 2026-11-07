# sysfetch

A fastfetch-style system information tool: your logo/avatar rendered on the left (colored
character blocks that work in any terminal, with automatic upgrade to the kitty graphics
protocol where supported), and full system information on the right.

## Features

- Shows: OS, host model, kernel, uptime, package count, shell, desktop environment, window
  manager, resolution, terminal, CPU, GPU, memory, disk, battery, local IP, locale, time,
  and a color palette row
- Config-file driven (`conf.txt`) — swap in any PNG/JPG avatar or plain-text ASCII art
- Automatic terminal capability detection: kitty/WezTerm/Ghostty use the high-resolution
  kitty graphics protocol; everything else falls back to colored character blocks
- Graceful degradation: if `chafa` is missing, only the text info is printed

## Installation

```bash
git clone https://github.com/AzenDev2026/sysfetch.git
cd sysfetch
./install.sh
source ~/.bashrc     # or just open a new terminal
sysfetch
```

Installed to:

- Command: `~/.local/bin/sysfetch`
- Data: `~/.local/share/sysfetch/` (`conf.txt`, `ascii.txt`, `nvazen.png`)

## Customization

Copy `~/.local/share/sysfetch/conf.txt` to `~/.config/sysfetch/conf.txt` and edit it:

```
{ascii-logo} : blue
/path/to/your/avatar.png     # your own image (absolute path) or ascii.txt

{sys-info} :
/etc/os-release
```

Changes take effect on the next run. Uninstall: `./uninstall.sh`

## Development

- Run the script directly from the repo — it uses `assets/conf.txt` automatically
- Inspect the output layout: `script -qec "sysfetch" /dev/null` and render the captured
  stream through a terminal emulator such as `pyte`
