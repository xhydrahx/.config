#!/bin/bash

get_cpu_usage() {
  if command -v mpstat &> /dev/null; then
    mpstat 1 1 | awk '$12 ~ /[0-9.]+/ {print 100 - $12 "%"}'
  elif command -v top &> /dev/null; then
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1 "%"}'
  elif [[ -f /proc/stat ]]; then
    read -r cpu1 user1 nice1 system1 idle1 iowait1 irq1 softirq1 steal1 guest1 guest_nice1 < /proc/stat
    sleep 1
    read -r cpu2 user2 nice2 system2 idle2 iowait2 irq2 softirq2 steal2 guest2 guest_nice2 < /proc/stat

    prev_total=$((user1 + nice1 + system1 + idle1 + iowait1 + irq1 + softirq1 + steal1))
    total=$((user2 + nice2 + system2 + idle2 + iowait2 + irq2 + softirq2 + steal2))

    prev_idle=$((idle1 + iowait1))
    idle=$((idle2 + iowait2))

    total_diff=$((total - prev_total))
    idle_diff=$((idle - prev_idle))
    usage_pct=$(( 100 * (total_diff - idle_diff) / total_diff ))

    echo "${usage_pct}%"
  else
    echo "N/A"
  fi
}

get_memory_usage() {
  if command -v free &> /dev/null; then
    free | grep Mem | awk '{printf "%.1f%%", $3/$2 * 100.0}'
  else
    echo "N/A"
  fi
}

echo " CPU: $(get_cpu_usage)   RAM: $(get_memory_usage)"
