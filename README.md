# AntiMark

<p>
  <a href="https://github.com/ATK12/AntiMark/releases/latest"><img src="https://img.shields.io/github/v/release/ATK12/AntiMark?style=for-the-badge&label=release%20%E6%AD%A3%E5%BC%8F%E7%89%88&color=2d9b4e" alt="release 正式版"></a>
  <a href="https://www.coolapk.com/feed/73308859?s=ODZmN2ZkN2YxYTBjODljZzZhODQyMTYwega1640"><img src="https://img.shields.io/badge/%E9%85%B7%E5%AE%89%E6%9B%B4%E6%96%B0%E6%97%A5%E5%BF%97-v3.0.0-1296db?style=for-the-badge&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI%2BPGNpcmNsZSBjeD0iMTIiIGN5PSIxMiIgcj0iMTEiIGZpbGw9IiMxMmI3NmEiLz48dGV4dCB4PSIxMiIgeT0iMTciIGZvbnQtc2l6ZT0iMTQiIGZvbnQtZmFtaWx5PSJzYW5zLXNlcmlmIiBmb250LXdlaWdodD0iYm9sZCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0iI2ZmZiI%2B6YW3PC90ZXh0Pjwvc3ZnPg%3D%3D" alt="酷安更新日志 v3.0.0"></a>
  <a href="https://qun.qq.com/universal-share/share?ac=1&authKey=FmaQxehJSVhhPzDvoZHfkjLEn6TNZgRC%2BJrFtmBnqDWPeKQo0Q2HUyJzTeHqy5At&busi_data=eyJncm91cENvZGUiOiIxMDYzNTc1NzUwIiwidG9rZW4iOiJUNDR2Q1grYkZYVkFtaGNzV2FVR0l5Q0xDKzRBOXdKcCtsZHhSMExGTStrMSt2WFgvaVhzeVdyYlJyRUFrNFl5IiwidWluIjoiMTIyNTM1MjA4MiJ9&data=MiT3Mag2kSn4V_CF_XT8SJ9nylmCo8ZH5GCVVyK-kNQfPjnmO6shnKBHYmnHvDGhglbeAgSLoJWbZMn_iYjfRg&svctype=4&tempid=h5_group_info"><img src="https://img.shields.io/badge/%E4%BA%A4%E6%B5%81%E7%BE%A4-%E7%82%B9%E5%87%BB%E5%8A%A0%E5%85%A5-ff9d00?style=for-the-badge&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyByb2xlPSJpbWciIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48dGl0bGU%2BVGVuY2VudCBRUTwvdGl0bGU%2BPHBhdGggZD0iTTIxLjM5NSAxNS4wMzVhNDAgNDAgMCAwIDAtLjgwMy0yLjI2NGwtMS4wNzktMi42OTVjLjAwMS0uMDMyLjAxNC0uNTYyLjAxNC0uODM2QzE5LjUyNiA0LjYzMiAxNy4zNTEgMCAxMiAwUzQuNDc0IDQuNjMyIDQuNDc0IDkuMjQxYzAgLjI3NC4wMTMuODA0LjAxNC44MzZsLTEuMDggMi42OTVhMzkgMzkgMCAwIDAtLjgwMiAyLjI2NGMtMS4wMjEgMy4yODMtLjY5IDQuNjQzLS40MzggNC42NzMuNTQuMDY1IDIuMTAzLTIuNDcyIDIuMTAzLTIuNDcyIDAgMS40NjkuNzU2IDMuMzg3IDIuMzk0IDQuNzcxLS42MTIuMTg4LTEuMzYzLjQ3OS0xLjg0NS44MzUtLjQzNC4zMi0uMzc5LjY0Ni0uMzAxLjc3OC4zNDMuNTc4IDUuODgzLjM2OSA3LjQ4Mi4xODkgMS42LjE4IDcuMTQuMzg5IDcuNDgzLS4xODkuMDc4LS4xMzIuMTMyLS40NTgtLjMwMS0uNzc4LS40ODMtLjM1Ni0xLjIzMy0uNjQ2LTEuODQ2LS44MzYgMS42MzctMS4zODQgMi4zOTMtMy4zMDIgMi4zOTMtNC43NzEgMCAwIDEuNTYzIDIuNTM3IDIuMTAzIDIuNDcyLjI1MS0uMDMuNTgxLTEuMzktLjQzOC00LjY3MyIvPjwvc3ZnPg%3D%3D" alt="交流群 点击加入"></a>
</p>

> 鸣谢：感谢酷安平台以下两篇公开情报的作者，其逆向成果是模块检测点核查的对照基线：
> - 酷安《15 路 Root 检测器逆向（v7.7）》——15 路检测器槽位矩阵与判定逻辑
> - 酷安《环境检测三种模式（v2.7）》——环境检测组与行为画像维度

AntiMark 是一个面向 Android 的反指纹 / 设备标识覆盖模块（Magisk / KernelSU / APatch）。

对设备上可被应用读取的各类标识做随机化/伪造覆盖，降低设备指纹被唯一识别的风险，并附带 DRM 假 ID 集成（P2 DRM）。

## 覆盖范围

| 类别 | 说明 |
|------|------|
| SERIAL | ro.serialno 等四属性 + persist 持久化 + 重启 reinject |
| ANDROID ID / SSAID | settings 数据库处理 |
| OAID / appset / GSF / 广告 ID | 属性层覆盖 |
| WiFi / 蓝牙 MAC | 64 前缀池 + 防撞 |
| DRM ID | 假库 bind mount + 符号地址随机化 |
| QIMEI | TDM/QIMEI 跨应用清理 |
| TEE | 密钥重置 |
| HOSTNAME | net.hostname / persist.sys.hostname / ro.boot.hostname 三写 |
| 蓝牙 device_id | vendor_id / product_id 随机化 |

硬件层标识（ICCID / IMSI）由基带固件管理，模块不做伪造（详见 docs/漏洞修复记录.md）。

## 安装

1. 下载 Release 中的 zip 包
2. Magisk / KernelSU / APatch 管理器中选择安装
3. 重启生效

要求：Android 10+，已 root。安装时对 Android 17（SDK 37+）未验证会中止。

## 目录结构

```
├── service.sh          # boot 主逻辑：清理 + Web 控制台
├── customize.sh        # 安装检查 + 供应链哈希校验（SHA256SUMS）
├── post-fs-data.sh     # 早期启动
├── uninstall.sh        # 卸载恢复
├── srv.sh              # WebUI 服务
├── drmid/              # DRM 假 ID 模块（模板/适配/挂载）
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
