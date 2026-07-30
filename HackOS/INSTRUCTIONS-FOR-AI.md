# Техзадание для сборщика (другого ИИ или человека)

Цель: собрать загрузочный `.iso` из этого проекта.

## Среда сборки
- Debian 12 (bookworm) или Ubuntu 22.04+, amd64.
- root (sudo), интернет, ≥ 20 ГБ свободно.
- Пакет: `sudo apt install -y live-build`.

## Шаги
1. Распаковать архив, `cd HackOS`.
2. `sudo ./build.sh` (вызовет ./auto/config → lb build).
3. Результат: `hackos-amd64.hybrid.iso`.

## Проверка без флешки (QEMU)
```bash
qemu-system-x86_64 -m 4096 -enable-kvm -cdrom hackos-amd64.hybrid.iso -boot d
```

## Кастомизация
- Пакеты: дописывай имена в `config/package-lists/*.list.chroot` (по одному на строку).
- Свои команды: клади скрипты в `config/includes.chroot/usr/local/bin/` + chmod +x.

## Учётная запись (live)
- Пользователь `user`, пароль `live`. Автовход в консоль на tty1.

## Частые проблемы
- «lb: command not found» → нет live-build.
- Ошибки загрузки пакетов → проверь интернет/зеркало.
- Нет места → `sudo lb clean --purge` и заново.
