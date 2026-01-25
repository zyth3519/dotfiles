请在 SteamOS 中切换到桌面模式并打开 Konsole 应用程序。如果你运行 efibootmgr 命令，你的输出应该看起来像这样：

```
BootCurrent: 0000
Timeout: 0 seconds
BootOrder: 0002,0000,2001, 2002, 2003
Boot0000* SteamOs
Boot0002* Windows Boot Manager
Boot2001* EFI USB Device
Boot2002* EFI DVD/CDROM
Boot2003* EFI Network
```

SteamOS 的实际启动编号（在本例中为 0000）可能会有所不同，有时会在系统更新或切换到测试版/预览频道时发生变化。

为了解决这个问题，我编写的 systemd 服务将获取 BootCurrent 值并将 BootNext 设置为此值。要创建服务，您需要在 /etc/systemd/system 中创建一个单元文件（具有 root 权限），我选择将其命名为 bootnext-steamos.service，如下所示：

```sudo vim /etc/systemd/system/bootnext-steamos.service```

输入您的密码，然后写入或粘贴以下内容：

```
[Unit]
Description=Set UEFI BootNext to SteamOS

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/bin/bash -c 'efibootmgr -n $(efibootmgr | grep BootCurrent | tr -cd [:digit:])'

[Install]
WantedBy=multi-user.target
```
这里的 ExecStart 命令使用 bash shell（以避免在使用管道时需要另一个脚本文件）首先找到 BootCurrent 行并修剪任何非数字字符，然后将 BootNext 设置为此值。

现在，您只需要使用以下命令启用该服务：

```sudo systemctl enable --now bootnext-steamos.service```

要确认，请再次运行 efibootmgr，您应该会看到 BootNext 在输出中设置为正确的数字。继续并重新启动，只要它是之前的启动选择，SteamOS 现在应该默认启动。

从理论上讲，这应该不会影响 SteamOS 更新，但您可能希望通过执行以下操作来事先禁用该服务（或者如果您遇到问题）：

```sudo systemctl disable bootnext-steamos.service```

要完全删除设备文件，请先禁用它，然后运行：

```sudo rm /etc/systemd/system/bootnext-steamos.service```
