#!/system/bin/sh
# uninstall.sh — 卸载清理（正式版）
MODDIR="${0%/*}"
echo "== AntiMark 卸载清理开始 =="
# 1) 杀 Web 控制台进程
WEB_PID=$(busybox pidof srv.sh 2>/dev/null || pidof srv.sh 2>/dev/null)
[ -n "$WEB_PID" ] && kill $WEB_PID 2>/dev/null
busybox pkill -f 'nc -lk -p43827' 2>/dev/null || pkill -f 'nc -lk -p43827' 2>/dev/null
sleep 1
# 2) 清理模块运行时痕迹（管理器随后删整个目录，这里先清防异常残留）
rm -f "$MODDIR/.state" "$MODDIR/.svc_token" 2>/dev/null
rm -f /data/local/tmp/.am_handle /data/local/tmp/.am_ts 2>/dev/null
# 3) 残留检查
echo "== 残留检查 =="
echo "SELinux: $(getenforce 2>/dev/null)"
LEFTOVER=$(busybox pidof srv.sh 2>/dev/null || pidof srv.sh 2>/dev/null)
[ -n "$LEFTOVER" ] && echo "警告: srv.sh 进程仍存在 ($LEFTOVER)" || echo "Web 进程: 已退出"
echo "== 卸载完成 =="