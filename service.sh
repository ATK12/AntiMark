#!/system/bin/sh
# service.sh — AntiMark 正式版（正式版）启动逻辑
# 职责：初始化状态文件 + 拉起 Web 控制台。不含任何设备标识修改/清理行为。
MODDIR="${0%/*}"
STATE_FILE="$MODDIR/.state"

log() { echo "[$(date '+%m-%d %H:%M')] $*" >> "$STATE_FILE" 2>/dev/null; }
chmod 600 "$STATE_FILE" 2>/dev/null

# 状态文件超长截断（防无限膨胀）
if [ "$(wc -l < "$STATE_FILE" 2>/dev/null || echo 0)" -gt 2000 ]; then
    tail -1000 "$STATE_FILE" > "$STATE_FILE.tmp" 2>/dev/null && mv "$STATE_FILE.tmp" "$STATE_FILE" 2>/dev/null
fi

log "service: boot init (release build v1.0.0)"

# 拉起 Web 控制台（状态/日志页）
sh "$MODDIR/srv.sh" serve >/dev/null 2>&1 &
log "service: webui started"