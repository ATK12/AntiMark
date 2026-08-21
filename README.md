# AntiMark

<p>
  <a href="https://github.com/ATK12/AntiMark/releases/latest"><img src="https://img.shields.io/github/v/release/ATK12/AntiMark?style=for-the-badge&label=release%20%E6%AD%A3%E5%BC%8F%E7%89%88&color=2d9b4e" alt="release 正式版"></a>
</p>

AntiMark 是一个面向 Android 的设备标识管理模块（Magisk / KernelSU / APatch），用于管理设备上可被应用读取的各类标识。

## 安装

1. 下载 Release 中的 zip 包
2. Magisk / KernelSU / APatch 管理器中选择安装
3. 重启生效

要求：Android 10+，已 root。安装时对 Android 17（SDK 37+）未验证会中止。

## 目录结构

```
├── service.sh          # boot 主逻辑：初始化 + Web 控制台
├── customize.sh        # 安装检查 + 供应链哈希校验（SHA256SUMS）
├── post-fs-data.sh     # 早期启动
├── uninstall.sh        # 卸载恢复
├── srv.sh              # WebUI 服务
├── drmid/              # DRM 模块（模板/适配/挂载）
├── tools/              # 内置工具与库（带哈希校验）
├── webroot/            # Web 控制台静态页
└── docs/               # 技术文档
```

## 版本

当前版本：v3.0.0（versionCode 45）

完整修复历史见 [docs/漏洞修复记录.md](docs/漏洞修复记录.md)。

## 许可证

本仓库代码以 **GNU General Public License v3.0** 发布，见 [LICENSE](LICENSE)。

随模块分发的第三方工具（tools/ 下二进制：sqlite3、readline 等）版权归其各自作者，许可证以其自身声明为准，来源声明见 drmid/templates/NOTICE。

## 免责声明

本项目仅供学习研究使用。使用者需自行承担一切风险与责任。
