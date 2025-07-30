# Полный урок по WSL: Установка, управление дистрибутивами и работа с файлами

## Что такое WSL?

WSL (Windows Subsystem for Linux) — это функция Windows, которая позволяет запускать Linux-окружение прямо в Windows без использования виртуальных машин или двойной загрузки.

## 1. Первоначальная настройка WSL

### Включение WSL
Откройте PowerShell от имени администратора и выполните:

```powershell
# Включение WSL
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Включение платформы виртуальных машин (для WSL 2)
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

**Перезагрузите компьютер!**

### Установка WSL 2 (рекомендуется)
```powershell
# Установка WSL и установка WSL 2 как версии по умолчанию
wsl --install
wsl --set-default-version 2
```

## 2. Установка дистрибутивов Linux

### Просмотр доступных дистрибутивов
```powershell
wsl --list --online
```

### Установка нескольких дистрибутивов

**Способ 1: Через командную строку**
```powershell
# Установка Ubuntu
wsl --install -d Ubuntu

# Установка других дистрибутивов
wsl --install -d Ubuntu-22.04
wsl --install -d Debian
wsl --install -d kali-linux
wsl --install -d openSUSE-Leap-15.4
```

**Способ 2: Через Microsoft Store**
1. Откройте Microsoft Store
2. Найдите "Linux" или конкретный дистрибутив
3. Установите нужные дистрибутивы (Ubuntu, Debian, Kali Linux, openSUSE и др.)

### Просмотр установленных дистрибутивов
```powershell
wsl --list --verbose
```

## 3. Управление дистрибутивами

### Запуск конкретного дистрибутива
```powershell
# Запуск по имени
wsl -d Ubuntu
wsl -d Debian

# Запуск дистрибутива по умолчанию
wsl
```

### Установка дистрибутива по умолчанию
```powershell
wsl --set-default Ubuntu-22.04
```

### Остановка дистрибутивов
```powershell
# Остановить конкретный дистрибутив
wsl --terminate Ubuntu

# Остановить все запущенные дистрибутивы
wsl --shutdown
```

### Проверка статуса
```powershell
# Посмотреть запущенные дистрибутивы
wsl --list --running

# Подробная информация
wsl --status
```

## 4. Доступ к файлам Linux из Windows File Explorer

### Автоматический доступ через проводник Windows

**Метод 1: Сетевой путь**
В адресной строке проводника Windows введите:
```
\\wsl$
```

Вы увидите папки всех установленных дистрибутивов.

**Метод 2: Прямые пути к дистрибутивам**
```
\\wsl$\Ubuntu\home\username
\\wsl$\Debian\home\username
\\wsl$\kali-linux\home\username
```

**Метод 3: Из самого Linux**
В терминале WSL выполните:
```bash
# Открыть текущую папку в проводнике Windows
explorer.exe .

# Открыть домашнюю папку
explorer.exe ~

# Открыть корневую папку
explorer.exe /
```

### Создание ярлыков для быстрого доступа

1. Откройте проводник Windows
2. Перейдите к `\\wsl$\Ubuntu\home\yourusername`
3. Щелкните правой кнопкой мыши → "Создать ярлык"
4. Перетащите ярлык на рабочий стол или в панель задач

### Монтирование Windows дисков в Linux

Диски Windows автоматически монтируются в `/mnt/`:
```bash
# Доступ к диску C:
cd /mnt/c

# Доступ к диску D:
cd /mnt/d

# Просмотр всех смонтированных дисков
ls /mnt/
```

## 5. Работа с файлами между системами

### Копирование файлов

**Из Windows в Linux:**
```bash
# Копировать файл с диска C: в домашнюю папку Linux
cp /mnt/c/Users/YourName/Desktop/file.txt ~/
```

**Из Linux в Windows:**
```bash
# Копировать файл из Linux на рабочий стол Windows
cp ~/file.txt /mnt/c/Users/YourName/Desktop/
```

### Редактирование файлов

**Открыть файл Linux в Windows редакторе:**
```bash
# Открыть в блокноте
notepad.exe ~/myfile.txt

# Открыть в VS Code
code ~/myfile.txt
```

## 6. Удаление дистрибутивов WSL

### Способ 1: Полное удаление через командную строку
```powershell
# Остановить дистрибутив
wsl --terminate Ubuntu

# Отменить регистрацию и удалить дистрибутив
wsl --unregister Ubuntu
```

**⚠️ Внимание:** Эта команда удалит все данные в дистрибутиве!

### Способ 2: Удаление через приложения Windows

1. Откройте **Параметры Windows** (Win + I)
2. Перейдите в **Приложения** → **Приложения и возможности**
3. Найдите нужный Linux дистрибутив
4. Нажмите **Удалить**

### Способ 3: Экспорт перед удалением (резервная копия)

```powershell
# Создать резервную копию
wsl --export Ubuntu C:\backup\ubuntu-backup.tar

# Удалить дистрибутив
wsl --unregister Ubuntu

# Восстановить из резервной копии (при необходимости)
wsl --import Ubuntu C:\wsl\Ubuntu C:\backup\ubuntu-backup.tar
```

## 7. Полезные команды для управления WSL

### Обновление WSL
```powershell
wsl --update
```

### Изменение версии WSL для дистрибутива
```powershell
# Изменить на WSL 2
wsl --set-version Ubuntu 2

# Изменить на WSL 1
wsl --set-version Ubuntu 1
```

### Импорт и экспорт дистрибутивов
```powershell
# Экспорт
wsl --export Ubuntu C:\backup\ubuntu.tar

# Импорт
wsl --import MyUbuntu C:\wsl\MyUbuntu C:\backup\ubuntu.tar
```

## 8. Настройка производительности

### Конфигурационный файл .wslconfig

Создайте файл `.wslconfig` в папке `C:\Users\YourName\`:

```ini
[wsl2]
# Ограничение памяти для WSL 2
memory=4GB
# Количество процессоров
processors=2
# Отключить подкачку
swap=0
```

## 9. Практические советы

### Быстрый доступ к WSL из любого места
- Добавьте `wsl` в переменные окружения PATH
- Используйте Windows Terminal для удобной работы
- Настройте псевдонимы в PowerShell

### Автозапуск служб в WSL
Создайте скрипт запуска в `/etc/init.d/` или используйте systemd (в новых версиях WSL).

### Сетевое взаимодействие
WSL 2 использует виртуальную сеть, IP-адрес может изменяться. Для доступа к службам Linux из Windows используйте `localhost`.

**Узнать IP-адрес WSL:**
```bash
ip addr show eth0
```

## Заключение

WSL предоставляет мощные возможности для разработки и работы с Linux-инструментами прямо в Windows. Основные возможности:

- **Несколько дистрибутивов** одновременно
- **Простой доступ к файлам** через проводник Windows
- **Легкое управление** через командную строку
- **Интеграция** с Windows-приложениями

Следуя этому руководству, вы сможете эффективно использовать WSL для своих задач!