# Урок: Установка и работа с Ubuntu 24.04 через Docker

## Что такое Docker?

Docker — это платформа для разработки, доставки и запуска приложений в контейнерах. Контейнеры позволяют "упаковать" приложение со всеми его зависимостями в легковесную, портируемую единицу.

## 1. Установка Docker

### Windows

**Способ 1: Docker Desktop (рекомендуется)**
1. Скачайте Docker Desktop с официального сайта: https://www.docker.com/products/docker-desktop
2. Установите и перезагрузите компьютер
3. Запустите Docker Desktop

**Способ 2: Через WSL 2**
```bash
# В WSL терминале
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
```

### macOS
```bash
# Через Homebrew
brew install docker
brew install docker-compose

# Или скачать Docker Desktop с официального сайта
```

### Linux (Ubuntu/Debian)
```bash
# Обновление пакетов
sudo apt update

# Установка зависимостей
sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release

# Добавление GPG ключа Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Добавление репозитория
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Установка Docker
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io

# Добавление пользователя в группу docker
sudo usermod -aG docker $USER

# Автозапуск Docker
sudo systemctl enable docker
sudo systemctl start docker
```

### Проверка установки
```bash
docker --version
docker run hello-world
```

## 2. Работа с Ubuntu 24.04 в Docker

### Скачивание образа Ubuntu 24.04
```bash
# Скачать официальный образ Ubuntu 24.04 LTS
docker pull ubuntu:24.04

# Или скачать последнюю версию (обычно это и есть 24.04)
docker pull ubuntu:latest

# Посмотреть скачанные образы
docker images
```

### Запуск контейнера Ubuntu 24.04

**Интерактивный режим (рекомендуется для изучения)**
```bash
# Запуск с интерактивным терминалом
docker run -it ubuntu:24.04

# Запуск с именем контейнера
docker run -it --name my-ubuntu ubuntu:24.04

# Запуск со смонтированной папкой
docker run -it -v /path/to/local/folder:/workspace ubuntu:24.04
```

**Фоновый режим**
```bash
# Запуск в фоне с командой
docker run -d --name ubuntu-server ubuntu:24.04 sleep infinity

# Подключение к запущенному контейнеру
docker exec -it ubuntu-server bash
```

## 3. Первоначальная настройка Ubuntu в контейнере

После входа в контейнер выполните базовую настройку:

```bash
# Обновление списка пакетов
apt update

# Обновление системы
apt upgrade -y

# Установка основных инструментов
apt install -y \
    curl \
    wget \
    vim \
    nano \
    git \
    htop \
    tree \
    unzip \
    zip \
    sudo \
    software-properties-common

# Установка локали
apt install -y locales
locale-gen en_US.UTF-8
export LANG=en_US.UTF-8
```

## 4. Создание пользователя (опционально)

```bash
# Создание нового пользователя
adduser developer

# Добавление в группу sudo
usermod -aG sudo developer

# Переключение на пользователя
su - developer
```

## 5. Сохранение изменений в контейнере

### Создание собственного образа
```bash
# Выйти из контейнера (Ctrl+D или exit)

# Сохранить изменения в новый образ
docker commit my-ubuntu my-ubuntu-configured:latest

# Посмотреть созданный образ
docker images
```

### Создание Dockerfile для автоматизации

Создайте файл `Dockerfile`:

```dockerfile
# Используем Ubuntu 24.04 как базовый образ
FROM ubuntu:24.04

# Метаданные
LABEL maintainer="your-email@example.com"
LABEL description="Ubuntu 24.04 with development tools"

# Предотвращение интерактивных запросов при установке
ENV DEBIAN_FRONTEND=noninteractive

# Обновление системы и установка пакетов
RUN apt update && apt upgrade -y && \
    apt install -y \
        curl \
        wget \
        vim \
        nano \
        git \
        htop \
        tree \
        unzip \
        zip \
        sudo \
        software-properties-common \
        build-essential \
        python3 \
        python3-pip \
        nodejs \
        npm && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Установка локали
RUN apt update && apt install -y locales && \
    locale-gen en_US.UTF-8 && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Создание пользователя
RUN useradd -m -s /bin/bash developer && \
    echo "developer:developer" | chpasswd && \
    usermod -aG sudo developer

# Установка рабочей директории
WORKDIR /home/developer

# Переключение на пользователя
USER developer

# Команда по умолчанию
CMD ["/bin/bash"]
```

**Сборка образа из Dockerfile:**
```bash
# Сборка образа
docker build -t my-ubuntu-dev:24.04 .

# Запуск контейнера из созданного образа
docker run -it my-ubuntu-dev:24.04
```

## 6. Работа с файлами и папками

### Монтирование директорий
```bash
# Монтирование локальной папки в контейнер
docker run -it -v /home/user/projects:/workspace ubuntu:24.04

# Монтирование с правами на запись
docker run -it -v /home/user/projects:/workspace:rw ubuntu:24.04

# Монтирование нескольких папок
docker run -it \
    -v /home/user/projects:/workspace \
    -v /home/user/data:/data \
    ubuntu:24.04
```

### Копирование файлов
```bash
# Копирование файла из контейнера на хост
docker cp container_name:/path/to/file /local/path/

# Копирование файла с хоста в контейнер
docker cp /local/path/file container_name:/path/to/destination/
```

## 7. Сеть и порты

### Проброс портов
```bash
# Проброс одного порта
docker run -it -p 8080:80 ubuntu:24.04

# Проброс нескольких портов
docker run -it -p 8080:80 -p 3000:3000 ubuntu:24.04

# Автоматический проброс всех портов
docker run -it -P ubuntu:24.04
```

### Сетевые настройки
```bash
# Запуск с доступом к сети хоста
docker run -it --network host ubuntu:24.04

# Создание пользовательской сети
docker network create my-network
docker run -it --network my-network ubuntu:24.04
```

## 8. Управление контейнерами

### Основные команды
```bash
# Посмотреть запущенные контейнеры
docker ps

# Посмотреть все контейнеры (включая остановленные)
docker ps -a

# Остановить контейнер
docker stop container_name

# Запустить остановленный контейнер
docker start container_name

# Перезапустить контейнер
docker restart container_name

# Удалить контейнер
docker rm container_name

# Удалить запущенный контейнер принудительно
docker rm -f container_name
```

### Мониторинг
```bash
# Посмотреть использование ресурсов
docker stats

# Посмотреть логи контейнера
docker logs container_name

# Следить за логами в реальном времени
docker logs -f container_name

# Информация о контейнере
docker inspect container_name
```

## 9. Docker Compose для Ubuntu 24.04

Создайте файл `docker-compose.yml`:

```yaml
version: '3.8'

services:
  ubuntu-dev:
    image: ubuntu:24.04
    container_name: ubuntu-development
    stdin_open: true
    tty: true
    volumes:
      - ./workspace:/workspace
      - ./data:/data
    ports:
      - "8080:80"
      - "3000:3000"
    environment:
      - DEBIAN_FRONTEND=noninteractive
    command: /bin/bash
    restart: unless-stopped

  ubuntu-server:
    image: ubuntu:24.04
    container_name: ubuntu-web-server
    volumes:
      - ./web:/var/www/html
    ports:
      - "80:80"
    command: >
      bash -c "
        apt update &&
        apt install -y apache2 &&
        service apache2 start &&
        tail -f /var/log/apache2/access.log
      "
    restart: unless-stopped
```

**Запуск через Docker Compose:**
```bash
# Запуск всех сервисов
docker-compose up -d

# Подключение к контейнеру
docker-compose exec ubuntu-dev bash

# Остановка всех сервисов
docker-compose down
```

## 10. Практические примеры использования

### Веб-разработка
```bash
# Запуск Ubuntu с Node.js окружением
docker run -it -v $(pwd):/app -w /app -p 3000:3000 ubuntu:24.04 bash

# Внутри контейнера:
apt update
apt install -y nodejs npm
npm init -y
npm install express
# ... разработка приложения
```

### Python разработка
```bash
# Запуск с Python окружением
docker run -it -v $(pwd):/code -w /code ubuntu:24.04 bash

# Внутри контейнера:
apt update
apt install -y python3 python3-pip python3-venv
python3 -m venv venv
source venv/bin/activate
pip install flask django
```

### Создание базы данных
```bash
# Запуск Ubuntu с MySQL
docker run -it -e MYSQL_ROOT_PASSWORD=mypassword ubuntu:24.04 bash

# Внутри контейнера:
apt update
apt install -y mysql-server
service mysql start
```

## 11. Очистка и обслуживание

```bash
# Удаление неиспользуемых образов
docker image prune

# Удаление всех остановленных контейнеров
docker container prune

# Полная очистка системы Docker
docker system prune -a

# Посмотреть использование места
docker system df
```

## 12. Советы и лучшие практики

### Оптимизация размера образа
- Используйте `.dockerignore` файл
- Объединяйте RUN команды
- Удаляйте временные файлы в том же слое
- Используйте alpine версии для меньшего размера

### Безопасность
- Не запускайте контейнеры от root без необходимости
- Используйте официальные образы
- Регулярно обновляйте образы
- Ограничивайте ресурсы контейнера

### Производительность
```bash
# Ограничение памяти
docker run -it --memory="1g" ubuntu:24.04

# Ограничение CPU
docker run -it --cpus="1.5" ubuntu:24.04

# Ограничение swap
docker run -it --memory="1g" --memory-swap="2g" ubuntu:24.04
```

## Заключение

Docker позволяет легко развернуть Ubuntu 24.04 в изолированной среде с возможностью:

- **Быст