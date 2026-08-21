#!/system/bin/sh
# clean.sh — 隐私清理：系统日志/统计/历史记录
# 不含：设备标识、WiFi 已保存网络、账户数据、密钥容器
MODDIR="${0%/*}"
STATE="$MODDIR/.state"
log() { echo "[$(date '+%m-%d %H:%M')] $*" >> "$STATE" 2>/dev/null; }

log "clean: start"
# 崩溃日志 DropBox
rm -rf /data/system/dropbox/* 2>/dev/null
# 应用使用统计
rm -rf /data/system/usagestats/* 2>/dev/null
# 应用空闲状态（截断并修回属主，防止 AppIdleController 崩溃）
[ -f /data/system/users/0/app_idle_stats.xml ] && { > /data/system/users/0/app_idle_stats.xml 2>/dev/null; chown system:system /data/system/users/0/app_idle_stats.xml 2>/dev/null; }
# 电池统计
[ -e /data/system/batterystats.bin ] && rm -f /data/system/batterystats.bin 2>/dev/null
# 启动统计
[ -e /data/misc/bootstat ] && rm -rf /data/misc/bootstat 2>/dev/null
# 进程统计
[ -e /data/system/procstats ] && rm -rf /data/system/procstats 2>/dev/null
# 网络流量统计
rm -rf /data/system/netstats/* 2>/dev/null
# 账户同步元数据（不清账户本身）
rm -rf /data/system/sync/* 2>/dev/null
# NFC 事件日志
[ -f /data/nfc/event_log.binpb ] && > /data/nfc/event_log.binpb 2>/dev/null
# 输入法用户词典
find /data/data/com.android.inputmethod.*/files -name "*.dict" -exec rm {} \; 2>/dev/null
log "clean: done"
echo "清理完成"