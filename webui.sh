#!/system/bin/sh
# webui.sh — KSU WebUI 入口（ReSukiSU 管理器点击 WebUI 时以 root 执行）
# 职责：确保 43827 控制台服务在跑，输出内联页面（含版本号）
MODDIR="${0%/*}"
PORT="43827"
if ! pgrep -f "srv.sh serve" >/dev/null 2>&1; then
	nohup sh "$MODDIR/srv.sh" serve >/dev/null 2>&1 &
	sleep 1
fi
AM_VER="$(sed -n 's/^version=//p' "$MODDIR/module.prop" 2>/dev/null | head -1)"
sed -e "s/__AM_VERSION__/${AM_VER:-unknown}/g" \
    "$MODDIR/webroot/index.html" 2>/dev/null || echo "<html><body>webroot/index.html missing</body></html>"