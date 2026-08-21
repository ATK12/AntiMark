#!/system/bin/sh
# srv.sh — AntiMark 正式版（正式版）Web 控制台
# serve=监听循环 / handle=处理请求；仅提供状态与日志查看，无任何操作接口
MODDIR="${0%/*}"
PORT="43827"
STATE="$MODDIR/.state"
IDLE_MAX="${AM_IDLE:-0}"

module_status() { [ -f "$STATE" ] && echo "RUNNING" || echo "INIT"; }
module_history() { [ -f "$STATE" ] && tail -50 "$STATE" | sed 's/$/<br>/' || echo "(无记录)"; }

handle_request() {
    read -r request
    method=$(echo "$request" | awk '{print $1}')
    full=$(echo "$request" | awk '{print $2}')
    path=${full%%\?*}
    if [ "$method" = "OPTIONS" ]; then
        printf 'HTTP/1.0 204 No Content\r\nAccess-Control-Allow-Origin: *\r\nAccess-Control-Allow-Methods: GET, OPTIONS\r\nAccess-Control-Max-Age: 86400\r\n\r\n'
        return
    fi
    case "$path" in
        /status) printf 'HTTP/1.0 200 OK\r\nAccess-Control-Allow-Origin: *\r\nContent-Type: text/plain\r\n\r\n%s' "$(module_status)" ;;
        /log)    printf 'HTTP/1.0 200 OK\r\nAccess-Control-Allow-Origin: *\r\nContent-Type: text/plain; charset=utf-8\r\n\r\n%s' "$(module_history)" ;;
        /clean)  printf 'HTTP/1.0 200 OK\r\nAccess-Control-Allow-Origin: *\r\nContent-Type: text/plain; charset=utf-8\r\n\r\n%s' "$(sh "$MODDIR/clean.sh" 2>&1)" ;;
        *)
            AM_VER="$(sed -n 's/^version=//p' "$MODDIR/module.prop" 2>/dev/null | head -1)"
            printf 'HTTP/1.0 200 OK\r\nContent-Type: text/html; charset=utf-8\r\nCache-Control: no-store\r\n\r\n'
            sed "s/__AM_VERSION__/${AM_VER:-unknown}/g" "$MODDIR/webroot/index.html" 2>/dev/null || echo "HTML not found"
            ;;
    esac
}

serve_loop() {
    command -v busybox >/dev/null 2>&1 || { echo "$(date '+%m-%d %H:%M') no busybox" >> "$STATE" 2>/dev/null; exit 1; }
    WRAP="/data/local/tmp/.am_handle"
    TS="/data/local/tmp/.am_ts"
    printf '#!/system/bin/sh\nsh %s handle\n' "$0" > "$WRAP" 2>/dev/null
    chmod 755 "$WRAP" 2>/dev/null
    NCPID=0
    trap 'kill "$NCPID" 2>/dev/null; rm -f "$WRAP" "$TS"' EXIT
    while true; do
        busybox nc -lk -p "$PORT" -s127.0.0.1 -e "$WRAP" 2>/dev/null &
        NCPID=$!
        idle=0
        last=$(stat -c %s "$TS" 2>/dev/null || echo 0)
        while kill -0 "$NCPID" 2>/dev/null; do
            sleep 5
            cur=$(stat -c %s "$TS" 2>/dev/null || echo 0)
            if [ "$cur" != "$last" ]; then
                last="$cur"; idle=0
            else
                idle=$((idle+5))
            fi
            if [ "$IDLE_MAX" -gt 0 ] && [ "$idle" -ge "$IDLE_MAX" ]; then
                echo "$(date '+%m-%d %H:%M') idle timeout" >> "$STATE" 2>/dev/null
                kill "$NCPID" 2>/dev/null
                sleep 1
                break
            fi
        done
        [ "$IDLE_MAX" -gt 0 ] && break
    done
    rm -f "$WRAP" "$TS" 2>/dev/null
}

case "$1" in
    serve) serve_loop ;;
    handle) handle_request ;;
    *) echo "usage: srv.sh serve|handle" ;;
esac