# AntiMark

<p>
  <a href="https://github.com/ATK12/AntiMark/releases/latest"><img src="https://img.shields.io/github/v/release/ATK12/AntiMark?style=for-the-badge&label=release%20%E6%AD%A3%E5%BC%8F%E7%89%88&color=2d9b4e" alt="release 正式版"></a>
</p>

AntiMark 是一个面向 Android 的设备标识管理模块（Magisk / KernelSU / APatch），提供设备标识状态查看与隐私清理能力。

## 功能

- **Web 控制台**：浏览器访问 `http://127.0.0.1:43827` 或通过 ReSukiSU 管理器 WebUI 入口打开，查看模块运行状态与日志
- **隐私清理**：一键清理系统日志、应用使用统计、网络流量统计等历史记录
- **状态日志**：模块运行日志留存，便于排查

## 安装

1. 下载 Release 中的 zip 包
2. Magisk / KernelSU / APatch 管理器中选择安装
3. 重启生效

要求：Android 10+，已 root。

## 目录结构

```
├── service.sh          # boot 主逻辑：初始化 + Web 控制台
├── clean.sh            # 隐私清理脚本
├── customize.sh        # 安装检查 + 供应链哈希校验（SHA256SUMS）
├── post-fs-data.sh     # 早期启动（占位）
├── uninstall.sh        # 卸载恢复
├── srv.sh              # WebUI 服务
├── webroot/            # Web 控制台静态页
└── tools/              # 内置工具与库（带哈希校验）
```

## 版本

当前版本：v1.0.0（versionCode 1）

## 许可证

本仓库代码以 **GNU General Public License v3.0** 发布，见 [LICENSE](LICENSE)。

随模块分发的第三方工具（tools/ 下二进制：sqlite3 等）版权归其各自作者，许可证以其自身声明为准。

## 免责声明

本项目仅供学习研究使用。使用者需自行承担一切风险与责任。