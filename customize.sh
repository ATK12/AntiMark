#!/system/bin/sh
# customize.sh - 安装检查（供应链哈希校验 + 环境清理）
# ---------- 供应链校验 ----------
MODPATH="${MODPATH:-${0%/*}}"
MODDIR="${MODDIR:-$MODPATH}"
command -v abort >/dev/null 2>&1 || abort() { echo "ERROR: $*"; exit 1; }
command -v ui_print >/dev/null 2>&1 || ui_print() { echo "$*"; }
if [ -f "$MODPATH/tools/SHA256SUMS" ]; then
    if ( cd "$MODPATH/tools" && sha256sum -c SHA256SUMS >/dev/null 2>&1 ); then
        ui_print "供应链校验: $(wc -l < "$MODPATH/tools/SHA256SUMS" 2>/dev/null) 个关键二进制哈希全部匹配"
    else
        ui_print "ERROR: 关键二进制哈希校验失败！"
        ui_print "tools/ 下文件与 SHA256SUMS 不一致，包可能已被篡改"
        abort "AntiMark 供应链校验失败，安装中止"
    fi
else
    ui_print "WARNING: tools/SHA256SUMS 缺失，跳过供应链校验"
fi
# ---------- 升级清理：杀旧版 Web 进程 ----------
pkill -f "modules/antimark/srv.sh" 2>/dev/null
pkill -f 'nc -lk -p43827' 2>/dev/null
# ---------- 权限 ----------
chmod 755 "$MODDIR/srv.sh" "$MODDIR/service.sh" "$MODDIR/uninstall.sh" "$MODDIR/webui.sh" 2>/dev/null
ui_print "安装完成。"