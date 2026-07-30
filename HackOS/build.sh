#!/bin/bash
# HackOS build script — собирает загрузочный .iso из этого проекта.
# Требует Debian/Ubuntu + live-build + root.
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
  echo "[!] Запусти с sudo: sudo ./build.sh" >&2
  exit 1
fi

if ! command -v lb >/dev/null 2>&1; then
  echo "[!] Не найден live-build. Установи: sudo apt update && sudo apt install -y live-build" >&2
  exit 1
fi

echo "[*] Очистка и конфигурация live-build..."
lb clean --purge || true
./auto/config

echo "[*] Делаем свои команды HackOS исполняемыми..."
chmod +x config/includes.chroot/usr/local/bin/* || true
chmod +x config/includes.chroot/etc/profile.d/*.sh || true

echo "[*] Старт сборки образа (долго: 20-60 мин)..."
lb build

ISO=$(ls -1 *.iso 2>/dev/null | head -n1 || true)
if [ -n "${ISO}" ]; then
  mv "${ISO}" hackos-amd64.hybrid.iso
  echo "[+] Готово: hackos-amd64.hybrid.iso"
else
  echo "[!] .iso не найден — смотри логи выше." >&2
  exit 1
fi
