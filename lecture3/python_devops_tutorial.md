# Python для DevOps: Базовый урок с практикой

## 📅 Структура урока

1. [История и обзор Python](#история-и-обзор-python)
2. [Версии Python и установка](#версии-python-и-установка)
3. [Python в DevOps](#python-в-devops)
4. [Основной синтаксис](#основной-синтаксис)
5. [Базовые структуры данных](#базовые-структуры-данных)
6. [Работа с API](#работа-с-api)
7. [Написание DevOps скриптов](#написание-devops-скриптов)

---

## 🐍 История и обзор Python

### История создания

**1989** - Гвидо ван Россум начинает работу над Python  
**1991** - Первый релиз Python 0.9.0  
**1994** - Python 1.0 с lambda, map, filter, reduce  
**2000** - Python 2.0 с list comprehensions  
**2008** - Python 3.0 (не совместим с Python 2)  
**2020** - Окончание поддержки Python 2.x  
**Сегодня** - Python 3.12+ активно развивается  

### Почему Python?

**Философия Python (PEP 20 - Zen of Python):**
- Красота лучше уродства
- Явное лучше неявного
- Простое лучше сложного
- Читаемость имеет значение
- Должен быть один очевидный способ сделать это

### Особенности языка

✅ **Простой синтаксис** - легко читать и писать  
✅ **Интерпретируемый** - не требует компиляции  
✅ **Кроссплатформенный** - работает везде  
✅ **Огромная экосистема** - библиотеки для всего  
✅ **Динамическая типизация** - не нужно объявлять типы  
✅ **Открытый исходный код** - бесплатный и открытый  

---

## 📦 Версии Python и установка

### Актуальные версии

| Версия | Статус | Особенности |
|--------|--------|-------------|
| **Python 3.12** | Текущая | Улучшенная производительность |
| **Python 3.11** | Поддержка | Быстрее на 10-60% |
| **Python 3.10** | Поддержка | Match-case, улучшенные сообщения об ошибках |
| **Python 3.9** | Поддержка | Операторы объединения словарей |
| **Python 3.8** | Поддержка | Walrus operator (:=) |

### Установка Python

#### Windows
```powershell
# Способ 1: Официальный сайт python.org
# Скачайте и установите с python.org

# Способ 2: Через Microsoft Store
# Найдите "Python 3.12" в Microsoft Store

# Способ 3: Через пакетный менеджер
winget install Python.Python.3.12
# или
choco install python
```

#### macOS
```bash
# Через Homebrew (рекомендуется)
brew install python@3.12

# Через официальный установщик с python.org
```

#### Linux (Ubuntu/Debian)
```bash
# Обновление системы
sudo apt update

# Установка Python 3 и pip
sudo apt install -y python3 python3-pip python3-venv

# Установка дополнительных пакетов для разработки
sudo apt install -y python3-dev build-essential

# Проверка установки
python3 --version
pip3 --version
```

### Управление версиями Python

#### pyenv (рекомендуется)
```bash
# Установка pyenv (Linux/macOS)
curl https://pyenv.run | bash

# Установка конкретной версии Python
pyenv install 3.12.0
pyenv install 3.11.5

# Переключение версий
pyenv global 3.12.0        # Глобально
pyenv local 3.11.5         # Для текущего проекта

# Просмотр установленных версий
pyenv versions
```

### Виртуальные окружения

```bash
# Создание виртуального окружения
python3 -m venv myproject-env

# Активация
# Linux/macOS:
source myproject-env/bin/activate
# Windows:
# myproject-env\Scripts\activate

# Установка пакетов
pip install requests flask pandas

# Сохранение зависимостей
pip freeze > requirements.txt

# Установка из requirements.txt
pip install -r requirements.txt

# Деактивация
deactivate
```

### 🎯 Задание 1: Установка и настройка
```bash
# 1. Проверьте версию Python
python3 --version
pip3 --version

# 2. Создайте виртуальное окружение
python3 -m venv devops-python
source devops-python/bin/activate  # Linux/macOS
# или devops-python\Scripts\activate  # Windows

# 3. Обновите pip
pip install --upgrade pip

# 4. Установите базовые пакеты
pip install requests json beautifulsoup4 pyyaml

# 5. Создайте первый скрипт
echo 'print("Hello DevOps Python!")' > hello.py
python3 hello.py
```

---

## 🛠️ Python в DevOps

### Зачем Python в DevOps?

#### 1. **Автоматизация инфраструктуры**
- Управление серверами (Ansible)
- Оркестрация контейнеров (Kubernetes Python клиенты)
- Infrastructure as Code (Pulumi, CDK)

#### 2. **CI/CD пипелайны**
- Скрипты развертывания
- Тестирование инфраструктуры
- Автоматизация релизов

#### 3. **Мониторинг и логирование**
- Сбор метрик
- Анализ логов
- Алертинг

#### 4. **Cloud automation**
- AWS SDK (boto3)
- Azure SDK
- Google Cloud SDK

### Популярные Python инструменты в DevOps

| Инструмент | Описание | Применение |
|-----------|----------|------------|
| **Ansible** | Автоматизация конфигурации | Управление серверами |
| **Fabric** | Удаленное выполнение команд | Развертывание |
| **Docker SDK** | Управление контейнерами | Контейнеризация |
| **Kubernetes client** | Управление K8s | Оркестрация |
| **Terraform CDK** | Infrastructure as Code | Инфраструктура |
| **Prometheus client** | Метрики | Мониторинг |

### Примеры использования в DevOps

```python
# Пример 1: Проверка статуса сервисов
import requests
import json

def check_service_health(url):
    try:
        response = requests.get(f"{url}/health", timeout=5)
        return response.status_code == 200
    except:
        return False

services = [
    "http://api.service1.com",
    "http://api.service2.com",
    "http://api.service3.com"
]

for service in services:
    status = "✅ UP" if check_service_health(service) else "❌ DOWN"
    print(f"{service}: {status}")
```

```python
# Пример 2: Парсинг логов
import re
from collections import Counter

def parse_nginx_logs(log_file):
    ip_pattern = r'(\d+\.\d+\.\d+\.\d+)'
    status_pattern = r'" (\d{3}) '
    
    ips = []
    statuses = []
    
    with open(log_file, 'r') as f:
        for line in f:
            ip_match = re.search(ip_pattern, line)
            status_match = re.search(status_pattern, line)
            
            if ip_match:
                ips.append(ip_match.group(1))
            if status_match:
                statuses.append(status_match.group(1))
    
    print("Top 5 IPs:")
    for ip, count in Counter(ips).most_common(5):
        print(f"  {ip}: {count}")
    
    print("\nStatus codes:")
    for status, count in Counter(statuses).items():
        print(f"  {status}: {count}")
```

---

## 📝 Основной синтаксис

### Базовый синтаксис

```python
# Комментарии
# Это однострочный комментарий

"""
Это многострочный
комментарий
"""

# Переменные (динамическая типизация)
name = "DevOps Engineer"
age = 30
salary = 75000.50
is_remote = True

# Вывод
print("Hello, World!")
print(f"Name: {name}, Age: {age}")

# Ввод
user_input = input("Enter your name: ")
```

### Типы данных

```python
# Основные типы
string_var = "Hello"
integer_var = 42
float_var = 3.14
boolean_var = True
none_var = None

# Проверка типа
print(type(string_var))    # <class 'str'>
print(isinstance(age, int))  # True
```

### Операторы

```python
# Арифметические
a, b = 10, 3
print(a + b)    # 13 - сложение
print(a - b)    # 7 - вычитание
print(a * b)    # 30 - умножение
print(a / b)    # 3.333... - деление
print(a // b)   # 3 - целочисленное деление
print(a % b)    # 1 - остаток
print(a ** b)   # 1000 - возведение в степень

# Сравнения
print(a > b)    # True
print(a == b)   # False
print(a != b)   # True

# Логические
print(True and False)  # False
print(True or False)   # True
print(not True)        # False
```

### Условные конструкции

```python
# if-elif-else
server_status = "running"

if server_status == "running":
    print("Server is operational")
elif server_status == "stopped":
    print("Server is down")
else:
    print("Server status unknown")

# Тернарный оператор
status_message = "Online" if server_status == "running" else "Offline"
```

### Циклы

```python
# For цикл
servers = ["web1", "web2", "db1", "cache1"]

for server in servers:
    print(f"Checking {server}...")

# For с индексом
for i, server in enumerate(servers):
    print(f"{i+1}. {server}")

# For с range
for i in range(5):
    print(f"Iteration {i}")

# While цикл
count = 0
while count < 3:
    print(f"Attempt {count + 1}")
    count += 1

# Контроль циклов
for server in servers:
    if server == "db1":
        continue  # Пропустить
    if server == "cache1":
        break     # Прервать цикл
    print(server)
```

### Функции

```python
# Простая функция
def greet(name):
    return f"Hello, {name}!"

# Функция с аргументами по умолчанию
def deploy_service(service_name, version="latest", environment="staging"):
    return f"Deploying {service_name}:{version} to {environment}"

# Функция с *args и **kwargs
def log_event(*args, **kwargs):
    print("Event:", args)
    print("Metadata:", kwargs)

# Использование
print(greet("DevOps Team"))
print(deploy_service("api", "v2.1", "production"))
log_event("user_login", "successful", user_id=123, ip="192.168.1.1")
```

### 🎯 Задание 2: Основы синтаксиса
```python
# Создайте файл basic_syntax.py и выполните задания:

# 1. Создайте переменные для DevOps окружения
project_name = "my-app"
environments = ["dev", "staging", "prod"]
cpu_usage = 75.5
is_healthy = True

# 2. Создайте функцию проверки статуса сервиса
def check_service_status(service_name, cpu_percent):
    if cpu_percent > 90:
        return f"{service_name}: CRITICAL - High CPU usage ({cpu_percent}%)"
    elif cpu_percent > 70:
        return f"{service_name}: WARNING - Moderate CPU usage ({cpu_percent}%)"
    else:
        return f"{service_name}: OK - Normal CPU usage ({cpu_percent}%)"

# 3. Проверьте статус для нескольких сервисов
services_data = [
    ("web-server", 45.2),
    ("database", 85.7),
    ("cache", 92.1),
    ("api-gateway", 60.3)
]

print("=== Service Status Report ===")
for service, cpu in services_data:
    print(check_service_status(service, cpu))

# 4. Создайте функцию для генерации конфигурации
def generate_config(app_name, **settings):
    config = f"[{app_name}]\n"
    for key, value in settings.items():
        config += f"{key} = {value}\n"
    return config

# Использование
config = generate_config(
    "my-api",
    port=8080,
    debug=False,
    max_connections=100
)
print("\n=== Generated Config ===")
print(config)
```

---

## 📊 Базовые структуры данных

### Списки (Lists) - Изменяемые упорядоченные коллекции

```python
# Создание списков
servers = ["web1", "web2", "db1"]
ports = [80, 443, 3306, 5432]
mixed_list = ["server", 8080, True, None]

# Основные операции
servers.append("cache1")              # Добавить элемент
servers.insert(1, "load-balancer")    # Вставить по индексу
servers.remove("db1")                 # Удалить элемент
last_server = servers.pop()           # Удалить и вернуть последний

# Доступ к элементам
print(servers[0])        # Первый элемент
print(servers[-1])       # Последний элемент
print(servers[1:3])      # Срез с 1 по 3 (не включая 3)

# Методы списков
print(len(servers))      # Длина списка
print("web1" in servers) # Проверка наличия
servers.sort()           # Сортировка
servers.reverse()        # Обращение

# List comprehensions (генераторы списков)
numbers = [1, 2, 3, 4, 5]
squares = [x**2 for x in numbers]
even_squares = [x**2 for x in numbers if x % 2 == 0]

print(squares)      # [1, 4, 9, 16, 25]
print(even_squares) # [4, 16]
```

#### DevOps примеры с списками

```python
# Управление списком серверов
production_servers = [
    "prod-web-01",
    "prod-web-02", 
    "prod-db-01",
    "prod-cache-01"
]

# Фильтрация веб-серверов
web_servers = [server for server in production_servers if "web" in server]
print("Web servers:", web_servers)

# Генерация команд для перезапуска
restart_commands = [f"sudo systemctl restart nginx@{server}" 
                   for server in web_servers]

for command in restart_commands:
    print(f"Executing: {command}")

# Группировка серверов по типу
server_types = {}
for server in production_servers:
    server_type = server.split("-")[1]  # извлекаем тип из имени
    if server_type not in server_types:
        server_types[server_type] = []
    server_types[server_type].append(server)

print("Servers by type:", server_types)
```

### Словари (Dictionaries) - Изменяемые коллекции ключ-значение

```python
# Создание словарей
server_info = {
    "hostname": "web-server-01",
    "ip": "192.168.1.10",
    "port": 80,
    "status": "running"
}

# Доступ к значениям
print(server_info["hostname"])           # web-server-01
print(server_info.get("port", 8080))     # 80 (или 8080 если ключа нет)

# Добавление и изменение
server_info["cpu_usage"] = 45.2
server_info["status"] = "maintenance"

# Удаление
del server_info["port"]
removed_value = server_info.pop("cpu_usage", 0)

# Методы словарей
print(server_info.keys())      # dict_keys(['hostname', 'ip', 'status'])
print(server_info.values())    # dict_values(['web-server-01', '192.168.1.10', 'maintenance'])
print(server_info.items())     # dict_items([('hostname', 'web-server-01'), ...])

# Dictionary comprehensions
ports = [80, 443, 3306, 5432]
port_status = {port: "open" for port in ports}
print(port_status)  # {80: 'open', 443: 'open', 3306: 'open', 5432: 'open'}
```

#### DevOps примеры со словарями

```python
# Конфигурация инфраструктуры
infrastructure = {
    "web_servers": {
        "count": 3,
        "instance_type": "t3.medium",
        "ami": "ami-12345678"
    },
    "database": {
        "engine": "postgresql",
        "version": "13.7",
        "instance_class": "db.t3.micro"
    },
    "load_balancer": {
        "type": "application",
        "scheme": "internet-facing"
    }
}

# Генерация Terraform конфигурации
def generate_terraform_vars(config):
    terraform_vars = {}
    for resource_type, settings in config.items():
        for key, value in settings.items():
            var_name = f"{resource_type}_{key}"
            terraform_vars[var_name] = value
    return terraform_vars

tf_vars = generate_terraform_vars(infrastructure)
print("Terraform variables:")
for var, value in tf_vars.items():
    print(f'{var} = "{value}"')

# Мониторинг метрик
server_metrics = {
    "web-01": {"cpu": 45.2, "memory": 78.5, "disk": 65.0},
    "web-02": {"cpu": 52.1, "memory": 82.3, "disk": 58.2},
    "db-01": {"cpu": 78.9, "memory": 91.2, "disk": 85.7}
}

# Поиск серверов с высокой нагрузкой
high_cpu_servers = {
    server: metrics["cpu"] 
    for server, metrics in server_metrics.items() 
    if metrics["cpu"] > 50
}

print("High CPU servers:", high_cpu_servers)
```

### Множества (Sets) - Неупорядоченные коллекции уникальных элементов

```python
# Создание множеств
production_ips = {"192.168.1.10", "192.168.1.11", "192.168.1.12"}
staging_ips = {"192.168.2.10", "192.168.2.11", "192.168.1.11"}  # есть пересечение

# Основные операции
production_ips.add("192.168.1.13")
production_ips.remove("192.168.1.10")
production_ips.discard("192.168.1.99")  # Не вызовет ошибку если элемента нет

# Операции с множествами
print("Intersection:", production_ips & staging_ips)    # Пересечение
print("Union:", production_ips | staging_ips)           # Объединение
print("Difference:", production_ips - staging_ips)      # Разность
print("Symmetric diff:", production_ips ^ staging_ips)  # Симметричная разность

# Проверки
print("192.168.1.11" in production_ips)
print(production_ips.issubset(staging_ips))
```

#### DevOps примеры с множествами

```python
# Управление правами доступа
admin_users = {"alice", "bob", "charlie"}
developer_users = {"bob", "david", "eve", "frank"}
qa_users = {"eve", "grace", "henry"}

# Пользователи с множественными ролями
multi_role_users = admin_users & developer_users
print("Users with multiple roles:", multi_role_users)

# Все пользователи системы
all_users = admin_users | developer_users | qa_users
print("All system users:", all_users)

# Пользователи только с правами разработчика
dev_only_users = developer_users - admin_users - qa_users
print("Developer-only users:", dev_only_users)

# Управление портами файрвола
allowed_ports_web = {80, 443, 8080, 8443}
allowed_ports_db = {3306, 5432, 27017}
currently_open_ports = {22, 80, 443, 3306, 8080}

# Порты, которые нужно закрыть
ports_to_close = currently_open_ports - allowed_ports_web - allowed_ports_db - {22}  # SSH всегда открыт
print("Ports to close:", ports_to_close)

# Недопустимые открытые порты
security_violation_ports = currently_open_ports - allowed_ports_web - allowed_ports_db - {22}
if security_violation_ports:
    print(f"SECURITY ALERT: Unauthorized ports open: {security_violation_ports}")
```

### 🎯 Задание 3: Работа со структурами данных
```python
# Создайте файл data_structures_devops.py

# 1. Управление серверами с помощью списков
servers = ["web-01", "web-02", "db-01", "cache-01", "lb-01"]

print("=== Server Management ===")
print(f"Total servers: {len(servers)}")

# Добавить новый сервер
servers.append("web-03")
print(f"Added web-03. Total: {len(servers)}")

# Найти все веб-серверы
web_servers = [s for s in servers if s.startswith("web")]
print(f"Web servers: {web_servers}")

# 2. Конфигурация окружений с помощью словарей
environments = {
    "development": {
        "servers": 2,
        "instance_type": "t2.micro",
        "auto_scaling": False
    },
    "staging": {
        "servers": 3,
        "instance_type": "t3.small", 
        "auto_scaling": True
    },
    "production": {
        "servers": 10,
        "instance_type": "t3.large",
        "auto_scaling": True
    }
}

print("\n=== Environment Configuration ===")
for env_name, config in environments.items():
    print(f"{env_name.upper()}:")
    for key, value in config.items():
        print(f"  {key}: {value}")

# Подсчет общего количества серверов
total_servers = sum(env["servers"] for env in environments.values())
print(f"\nTotal servers across all environments: {total_servers}")

# 3. Управление доступом с помощью множеств
admin_team = {"alice", "bob", "charlie"}
dev_team = {"bob", "david", "eve", "frank"}
ops_team = {"alice", "grace", "henry", "ivan"}

print("\n=== Access Management ===")
print(f"Admin team: {admin_team}")
print(f"Dev team: {dev_team}")
print(f"Ops team: {ops_team}")

# Пользователи с admin и dev правами
admin_devs = admin_team & dev_team
print(f"Admin + Dev users: {admin_devs}")

# Все пользователи
all_users = admin_team | dev_team | ops_team
print(f"All users: {all_users}")

# Пользователи только ops команды
ops_only = ops_team - admin_team - dev_team
print(f"Ops-only users: {ops_only}")

# 4. Мониторинг ресурсов
resource_usage = {
    "web-01": {"cpu": 45, "memory": 60, "disk": 70},
    "web-02": {"cpu": 55, "memory": 65, "disk": 75},
    "db-01": {"cpu": 80, "memory": 85, "disk": 90},
    "cache-01": {"cpu": 30, "memory": 40, "disk": 20}
}

print("\n=== Resource Monitoring ===")
# Серверы с высокой нагрузкой CPU (>50%)
high_cpu = [server for server, metrics in resource_usage.items() 
           if metrics["cpu"] > 50]
print(f"High CPU servers: {high_cpu}")

# Критические серверы (любой ресурс >85%)
critical_servers = []
for server, metrics in resource_usage.items():
    if any(value > 85 for value in metrics.values()):
        critical_servers.append(server)
print(f"Critical servers: {critical_servers}")

# Средняя загрузка по всем серверам
total_cpu = sum(metrics["cpu"] for metrics in resource_usage.values())
avg_cpu = total_cpu / len(resource_usage)
print(f"Average CPU usage: {avg_cpu:.1f}%")
```

---

## 🌐 Работа с API

### Введение в работу с API

**API (Application Programming Interface)** - интерфейс для взаимодействия между программами. В DevOps часто используются REST API для:
- Управления облачными ресурсами
- Мониторинга систем
- Автоматизации процессов
- Интеграции сервисов

### Библиотека requests

```python
import requests
import json

# GET запрос
response = requests.get("https://api.example.com/data")
print(f"Status: {response.status_code}")
print(f"Headers: {response.headers}")
print(f"JSON: {response.json()}")

# POST запрос с данными
data = {"name": "server-01", "status": "active"}
response = requests.post("https://api.example.com/servers", 
                        json=data,
                        headers={"Authorization": "Bearer token123"})

# Обработка ошибок
try:
    response = requests.get("https://api.example.com/data", timeout=5)
    response.raise_for_status()  # Вызовет исключение для HTTP ошибок
    data = response.json()
except requests.exceptions.RequestException as e:
    print(f"Error: {e}")
```

### Работа с Pokemon API

```python
import requests
import json

def get_pokemon_info(pokemon_name):
    """Получить информацию о покемоне"""
    url = f"https://pokeapi.co/api/v2/pokemon/{pokemon_name.lower()}"
    
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        
        pokemon_data = response.json()
        
        # Извлекаем нужную информацию
        info = {
            "name": pokemon_data["name"].title(),
            "id": pokemon_data["id"],
            "height": pokemon_data["height"],
            "weight": pokemon_data["weight"],
            "types": [t["type"]["name"] for t in pokemon_data["types"]],
            "abilities": [a["ability"]["name"] for a in pokemon_data["abilities"]],
            "stats": {stat["stat"]["name"]: stat["base_stat"] 
                     for stat in pokemon_data["stats"]}
        }
        
        return info
        
    except requests.exceptions.RequestException as e:
        return {"error": f"Failed to fetch data: {e}"}

# Использование
pokemon = get_pokemon_info("pikachu")
if "error" not in pokemon:
    print(f"Name: {pokemon['name']}")
    print(f"Types: {', '.join(pokemon['types'])}")
    print(f"Abilities: {', '.join(pokemon['abilities'])}")
    print("Stats:")
    for stat_name, value in pokemon['stats'].items():
        print(f"  {stat_name}: {value}")
else:
    print(pokemon["error"])

# Получение списка покемонов
def get_pokemon_list(limit=20):
    """Получить список покемонов"""
    url = f"https://pokeapi.co/api/v2/pokemon?limit={limit}"
    
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        
        data = response.json()
        pokemon_list = [pokemon["name"] for pokemon in data["results"]]
        
        return pokemon_list
        
    except requests.exceptions.RequestException as e:
        return []

# Анализ типов покемонов (DevOps подход)
def analyze_pokemon_types(pokemon_names):
    """Анализ типов покемонов как метрик"""
    type_counts = {}
    failed_requests = []
    
    print(f"Analyzing {len(pokemon_names)} Pokemon...")
    
    for name in pokemon_names:
        pokemon_info = get_pokemon_info(name)
        if "error" in pokemon_info:
            failed_requests.append(name)
            continue
            
        for ptype in pokemon_info["types"]:
            type_counts[ptype] = type_counts.get(ptype, 0) + 1
    
    # Сортировка по популярности
    sorted_types = sorted(type_counts.items(), key=lambda x: x[1], reverse=True)
    
    print(f"\n=== Pokemon Type Analysis ===")
    print(f"Successful requests: {len(pokemon_names) - len(failed_requests)}")
    print(f"Failed requests: {len(failed_requests)}")
    print("\nType distribution:")
    for ptype, count in sorted_types:
        percentage = (count / len(pokemon_names)) * 100
        print(f"  {ptype}: {count} ({percentage:.1f}%)")
    
    return type_counts, failed_requests

# Запуск анализа
pokemon_list = get_pokemon_list(50)
if pokemon_list:
    analyze_pokemon_types(pokemon_list[:20])  # Анализируем первые 20
```

### Работа с JSONPlaceholder API

```python
import requests

class JSONPlaceholderClient:
    """Клиент для работы с JSONPlaceholder API (имитация управления пользователями)"""
    
    def __init__(self):
        self.base_url = "https://jsonplaceholder.typicode.com"
    
    def get_users(self):
        """Получить всех пользователей (имитация получения списка серверов)"""
        response = requests.get(f"{self.base_url}/users")
        response.raise_for_status()
        return response.json()
    
    def get_user(self, user_id):
        """Получить конкретного пользователя"""
        response = requests.get(f"{self.base_url}/users/{user_id}")
        response.raise_for_status()
        return response.json()
    
    def create_user(self, user_data):
        """Создать пользователя (имитация создания сервера)"""
        response = requests.post(f"{self.base_url}/users", json=user_data)
        response.raise_for_status()
        return response.json()
    
    def update_user(self, user_id, user_data):
        """Обновить пользователя"""
        response = requests.put(f"{self.base_url}/users/{user_id}", json=user_data)
        response.raise_for_status()
        return response.json()
    
    def delete_user(self, user_id):
        """Удалить пользователя"""
        response = requests.delete(f"{self.base_url}/users/{user_id}")
        response.raise_for_status()
        return response.status_code == 200

# DevOps use case: Управление "серверами" через API
def manage_infrastructure():
    client = JSONPlaceholderClient()
    
    print("=== Infrastructure Management Demo ===")
    
    # Получить список "серверов" (пользователей)
    users = client.get_users()
    print(f"Current servers: {len(users)}")
    
    # Показать первые 3 "сервера"
    for user in users[:3]:
        print(f"  Server: {user['name']} ({user['email']}) - City: {user['address']['city']}")
    
    # Создать новый "сервер"
    new_server = {
        "name": "web-server-prod-01",
        "username": "webserver01",
        "email": "admin@webserver01.company.com",
        "address": {
            "street": "Data Center Row 1",
            "city": "New York",
            "zipcode": "10001"
        }
    }
    
    created_server = client.create_user(new_server)
    print(f"\nCreated new server: {created_server['name']} (ID: {created_server['id']})")
    
    # Обновить информацию о "сервере"
    updated_data = {
        "name": "web-server-prod-01-updated",
        "email": "admin@webserver01.company.com"
    }
    
    updated_server = client.update_user(created_server['id'], updated_data)
    print(f"Updated server: {updated_server['name']}")

# Запуск
manage_infrastructure()
```

### Работа с Countries API

```python
import requests

def get_country_info(country_name):
    """Получить информацию о стране"""
    url = f"https://restcountries.com/v3.1/name/{country_name}"
    
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        
        countries = response.json()
        if not countries:
            return None
            
        country = countries[0]  # Берем first match
        
        info = {
            "name": country["name"]["common"],
            "capital": country.get("capital", ["Unknown"])[0],
            "population": country.get("population", 0),
            "region": country.get("region", "Unknown"),
            "currencies": list(country.get("currencies", {}).keys()),
            "languages": list(country.get("languages", {}).values()),
            "timezones": country.get("timezones", [])
        }
        
        return info
        
    except requests.exceptions.RequestException as e:
        return {"error": str(e)}

def analyze_server_locations(countries):
    """Анализ локаций серверов по странам (DevOps use case)"""
    print("=== Server Location Analysis ===")
    
    total_population = 0
    regions = {}
    timezones = set()
    
    for country_name in countries:
        country_info = get_country_info(country_name)
        
        if not country_info or "error" in country_info:
            print(f"❌ Failed to get info for {country_name}")
            continue
            
        print(f"\n🏛️  {country_info['name']}")
        print(f"   Capital: {country_info['capital']}")
        print(f"   Population: {country_info['population']:,}")
        print(f"   Region: {country_info['region']}")
        print(f"   Timezones: {', '.join(country_info['timezones'])}")
        
        # Сбор статистики для анализа
        total_population += country_info['population']
        region = country_info['region']
        regions[region] = regions.get(region, 0) + 1
        timezones.update(country_info['timezones'])
    
    # Итоговая статистика
    print(f"\n=== Summary ===")
    print(f"Total population covered: {total_population:,}")
    print(f"Regions: {dict(regions)}")
    print(f"Total timezones to consider: {len(timezones)}")
    print(f"Timezone spread: {len(timezones)} zones")

# Пример: анализ стран для размещения серверов
server_locations = ["Germany", "Japan", "Brazil", "Australia", "Canada"]
analyze_server_locations(server_locations)
```

### Работа с Weather API

```python
import requests
from datetime import datetime

class WeatherMonitor:
    """Мониторинг погоды для дата-центров"""
    
    def __init__(self, api_key=None):
        # Для production используйте настоящий API ключ
        # Здесь используем OpenWeatherMap one call API
        self.api_key = api_key or "demo_key"  # Получите бесплатный ключ на openweathermap.org
        self.base_url = "http://api.openweathermap.org/data/2.5"
    
    def get_weather(self, city):
        """Получить текущую погоду для города"""
        url = f"{self.base_url}/weather"
        params = {
            "q": city,
            "appid": self.api_key,
            "units": "metric"  # Цельсий
        }
        
        try:
            response = requests.get(url, params=params, timeout=10)
            
            # Для демо используем бесплатный сервис без ключа
            if response.status_code == 401:
                return self._get_mock_weather(city)
            
            response.raise_for_status()
            return response.json()
            
        except requests.exceptions.RequestException:
            return self._get_mock_weather(city)
    
    def _get_mock_weather(self, city):
        """Заглушка для демонстрации без API ключа"""
        import random
        
        mock_data = {
            "name": city,
            "main": {
                "temp": random.uniform(15, 30),
                "humidity": random.uniform(40, 80),
                "pressure": random.uniform(1000, 1020)
            },
            "weather": [
                {
                    "main": random.choice(["Clear", "Clouds", "Rain"]),
                    "description": "mock weather data"
                }
            ],
            "wind": {
                "speed": random.uniform(1, 10)
            },
            "note": "Mock data for demo purposes"
        }
        return mock_data
    
    def check_datacenter_conditions(self, locations):
        """Проверить условия в дата-центрах"""
        print("=== Datacenter Weather Monitoring ===")
        
        alerts = []
        
        for city in locations:
            weather = self.get_weather(city)
            
            if not weather:
                alerts.append(f"❌ {city}: API unavailable")
                continue
            
            temp = weather["main"]["temp"]
            humidity = weather["main"]["humidity"]
            condition = weather["weather"][0]["main"]
            
            print(f"\n🏢 Datacenter: {city}")
            print(f"   Temperature: {temp:.1f}°C")
            print(f"   Humidity: {humidity:.1f}%")
            print(f"   Condition: {condition}")
            
            # Проверка критических условий
            status = "✅ OK"
            if temp > 35:
                status = "🔥 HIGH TEMP ALERT"
                alerts.append(f"{city}: Temperature {temp:.1f}°C exceeds safe limits")
            elif temp < 0:
                status = "🧊 LOW TEMP ALERT"
                alerts.append(f"{city}: Temperature {temp:.1f}°C below safe limits")
            elif humidity > 70:
                status = "💧 HIGH HUMIDITY ALERT"
                alerts.append(f"{city}: Humidity {humidity:.1f}% too high")
            elif condition in ["Rain", "Storm", "Snow"]:
                status = "⛈️  WEATHER ALERT"
                alerts.append(f"{city}: Adverse weather conditions ({condition})")
            
            print(f"   Status: {status}")
        
        # Отчет об алертах
        if alerts:
            print(f"\n🚨 ALERTS ({len(alerts)}):")
            for alert in alerts:
                print(f"   • {alert}")
        else:
            print(f"\n✅ All datacenters operating under normal conditions")
        
        return alerts

# Использование
weather_monitor = WeatherMonitor()

# Мониторинг дата-центров в разных городах
datacenter_locations = [
    "New York",
    "London", 
    "Tokyo",
    "Sydney",
    "Frankfurt"
]

alerts = weather_monitor.check_datacenter_conditions(datacenter_locations)

# Интеграция с системой алертинга
if alerts:
    print(f"\n📧 Sending {len(alerts)} alerts to operations team...")
    # Здесь может быть интеграция с Slack, PagerDuty, email и т.д.
```

### 🎯 Задание 4: Работа с API
```python
# Создайте файл api_devops_practice.py

import requests
import json
from datetime import datetime

# 1. Создайте DevOps мониторинг используя несколько API
class DevOpsMonitor:
    def __init__(self):
        self.services_status = {}
        self.alerts = []
    
    def check_pokemon_api_health(self):
        """Проверка здоровья Pokemon API (пример внешнего сервиса)"""
        try:
            response = requests.get("https://pokeapi.co/api/v2/pokemon/1", timeout=5)
            status = "UP" if response.status_code == 200 else "DOWN"
            response_time = response.elapsed.total_seconds()
            
            self.services_status["pokemon_api"] = {
                "status": status,
                "response_time": response_time,
                "checked_at": datetime.now().isoformat()
            }
            
            if response_time > 2.0:
                self.alerts.append(f"Pokemon API slow response: {response_time:.2f}s")
                
        except requests.exceptions.RequestException as e:
            self.services_status["pokemon_api"] = {
                "status": "DOWN",
                "error": str(e),
                "checked_at": datetime.now().isoformat()
            }
            self.alerts.append(f"Pokemon API is DOWN: {e}")
    
    def check_jsonplaceholder_health(self):
        """Проверка JSONPlaceholder API"""
        try:
            response = requests.get("https://jsonplaceholder.typicode.com/posts/1", timeout=5)
            status = "UP" if response.status_code == 200 else "DOWN"
            response_time = response.elapsed.total_seconds()
            
            self.services_status["placeholder_api"] = {
                "status": status,
                "response_time": response_time,
                "checked_at": datetime.now().isoformat()
            }
            
        except requests.exceptions.RequestException as e:
            self.services_status["placeholder_api"] = {
                "status": "DOWN", 
                "error": str(e),
                "checked_at": datetime.now().isoformat()
            }
            self.alerts.append(f"JSONPlaceholder API is DOWN: {e}")
    
    def generate_report(self):
        """Генерация отчета о состоянии сервисов"""
        print("=== DevOps Service Health Report ===")
        print(f"Generated at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        print()
        
        for service, status in self.services_status.items():
            icon = "✅" if status["status"] == "UP" else "❌"
            print(f"{icon} {service.upper()}: {status['status']}")
            
            if "response_time" in status:
                print(f"   Response time: {status['response_time']:.3f}s")
            if "error" in status:
                print(f"   Error: {status['error']}")
            print(f"   Last checked: {status['checked_at']}")
            print()
        
        if self.alerts:
            print("🚨 ALERTS:")
            for alert in self.alerts:
                print(f"   • {alert}")
        else:
            print("✅ No alerts - all services healthy")
    
    def run_health_check(self):
        """Запуск полной проверки здоровья"""
        print("Starting health check...")
        self.check_pokemon_api_health()
        self.check_jsonplaceholder_health()
        self.generate_report()

# 2. Создайте анализатор данных через API
def analyze_user_activity():
    """Анализ активности пользователей через JSONPlaceholder"""
    print("\n=== User Activity Analysis ===")
    
    try:
        # Получаем пользователей и их посты
        users_response = requests.get("https://jsonplaceholder.typicode.com/users")
        posts_response = requests.get("https://jsonplaceholder.typicode.com/posts")
        
        users = users_response.json()
        posts = posts_response.json()
        
        # Подсчет постов по пользователям
        user_posts = {}
        for post in posts:
            user_id = post["userId"]
            if user_id not in user_posts:
                user_posts[user_id] = 0
            user_posts[user_id] += 1
        
        # Создание отчета
        print(f"Total users: {len(users)}")
        print(f"Total posts: {len(posts)}")
        print(f"Average posts per user: {len(posts) / len(users):.1f}")
        print()
        
        print("Top 5 most active users:")
        sorted_users = sorted(user_posts.items(), key=lambda x: x[1], reverse=True)
        
        for user_id, post_count in sorted_users[:5]:
            user = next(u for u in users if u["id"] == user_id)
            print(f"  {user['name']} ({user['username']}): {post_count} posts")
        
        # Поиск неактивных пользователей
        inactive_users = [u for u in users if u["id"] not in user_posts]
        if inactive_users:
            print(f"\nInactive users: {len(inactive_users)}")
            for user in inactive_users:
                print(f"  • {user['name']}")
        
    except requests.exceptions.RequestException as e:
        print(f"Error analyzing user activity: {e}")

# 3. Создайте Pokemon team analyzer для демонстрации работы с API
def analyze_pokemon_team(pokemon_names):
    """Анализ команды покемонов (пример работы с внешним API)"""
    print(f"\n=== Pokemon Team Analysis ===")
    
    team_stats = {
        "total_hp": 0,
        "total_attack": 0,
        "total_defense": 0,
        "types": {},
        "abilities": set()
    }
    
    successful_fetches = 0
    
    for name in pokemon_names:
        try:
            response = requests.get(f"https://pokeapi.co/api/v2/pokemon/{name.lower()}", timeout=5)
            if response.status_code == 200:
                pokemon = response.json()
                
                # Извлекаем статистики
                stats = {stat["stat"]["name"]: stat["base_stat"] for stat in pokemon["stats"]}
                team_stats["total_hp"] += stats.get("hp", 0)
                team_stats["total_attack"] += stats.get("attack", 0)
                team_stats["total_defense"] += stats.get("defense", 0)
                
                # Типы покемонов
                for type_info in pokemon["types"]:
                    ptype = type_info["type"]["name"]
                    team_stats["types"][ptype] = team_stats["types"].get(ptype, 0) + 1
                
                # Способности
                for ability_info in pokemon["abilities"]:
                    team_stats["abilities"].add(ability_info["ability"]["name"])
                
                successful_fetches += 1
                print(f"✅ {pokemon['name'].title()}: HP={stats.get('hp', 0)}, ATK={stats.get('attack', 0)}, DEF={stats.get('defense', 0)}")
            
        except requests.exceptions.RequestException:
            print(f"❌ Failed to fetch {name}")
    
    if successful_fetches > 0:
        print(f"\n📊 Team Summary:")
        print(f"   Team size: {successful_fetches}/{len(pokemon_names)}")
        print(f"   Total HP: {team_stats['total_hp']}")
        print(f"   Total Attack: {team_stats['total_attack']}")
        print(f"   Total Defense: {team_stats['total_defense']}")
        print(f"   Types: {dict(team_stats['types'])}")
        print(f"   Unique abilities: {len(team_stats['abilities'])}")

# Запуск всех примеров
if __name__ == "__main__":
    # 1. Мониторинг сервисов
    monitor = DevOpsMonitor()
    monitor.run_health_check()
    
    # 2. Анализ активности пользователей
    analyze_user_activity()
    
    # 3. Анализ команды покемонов
    my_team = ["pikachu", "charizard", "blastoise", "venusaur", "gengar"]
    analyze_pokemon_team(my_team)
```

---

## 📜 Написание DevOps скриптов

### Структура DevOps скрипта

```python
#!/usr/bin/env python3
"""
DevOps Script Template
Description: Brief description of what this script does
Author: Your Name
Created: Date
"""

import sys
import argparse
import logging
import json
from pathlib import Path

# Настройка логирования
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('script.log'),
        logging.StreamHandler(sys.stdout)
    ]
)

logger = logging.getLogger(__name__)

def main():
    """Главная функция скрипта"""
    parser = argparse.ArgumentParser(description="DevOps Script")
    parser.add_argument("--config", required=True, help="Configuration file path")
    parser.add_argument("--dry-run", action="store_true", help="Dry run mode")
    parser.add_argument("--verbose", "-v", action="store_true", help="Verbose output")
    
    args = parser.parse_args()
    
    if args.verbose:
        logging.getLogger().setLevel(logging.DEBUG)
    
    logger.info("Script started")
    
    try:
        # Ваша логика здесь
        pass
    except Exception as e:
        logger.error(f"Script failed: {e}")
        sys.exit(1)
    finally:
        logger.info("Script completed")

if __name__ == "__main__":
    main()
```

### Пример 1: Скрипт мониторинга серверов

```python
#!/usr/bin/env python3
"""
Server Health Monitor
Monitors server health and sends alerts
"""

import requests
import smtplib
import json
import time
from datetime import datetime
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

class ServerMonitor:
    def __init__(self, config_file):
        with open(config_file, 'r') as f:
            self.config = json.load(f)
        
        self.servers = self.config['servers']
        self.alert_config = self.config['alerts']
        self.failed_checks = {}
    
    def check_server_health(self, server):
        """Проверка здоровья сервера"""
        try:
            # HTTP health check
            if 'health_url' in server:
                response = requests.get(
                    server['health_url'], 
                    timeout=server.get('timeout', 10)
                )
                
                if response.status_code != 200:
                    return False, f"HTTP {response.status_code}"
            
            # TCP port check
            if 'port' in server:
                import socket
                sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                sock.settimeout(server.get('timeout', 10))
                result = sock.connect_ex((server['host'], server['port']))
                sock.close()
                
                if result != 0:
                    return False, f"Port {server['port']} unreachable"
            
            return True, "OK"
            
        except Exception as e:
            return False, str(e)
    
    def send_alert(self, server, error_message):
        """Отправка алерта"""
        if not self.alert_config.get('enabled', False):
            print(f"ALERT (not sent): {server['name']} - {error_message}")
            return
        
        subject = f"🚨 Server Alert: {server['name']}"
        body = f"""
Server: {server['name']}
Host: {server['host']}
Error: {error_message}
Time: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}

Please check the server immediately.
        """
        
        try:
            msg = MIMEMultipart()
            msg['From'] = self.alert_config['smtp']['from']
            msg['To'] = ', '.join(self.alert_config['recipients'])
            msg['Subject'] = subject
            
            msg.attach(MIMEText(body, 'plain'))
            
            server = smtplib.SMTP(
                self.alert_config['smtp']['host'],
                self.alert_config['smtp']['port']
            )
            
            if self.alert_config['smtp'].get('use_tls'):
                server.starttls()
            
            if 'username' in self.alert_config['smtp']:
                server.login(
                    self.alert_config['smtp']['username'],
                    self.alert_config['smtp']['password']
                )
            
            server.send_message(msg)
            server.quit()
            
            print(f"✅ Alert sent for {server['name']}")
            
        except Exception as e:
            print(f"❌ Failed to send alert: {e}")
    
    def run_monitoring_cycle(self):
        """Один цикл мониторинга"""
        print(f"\n=== Monitoring Cycle - {datetime.now().strftime('%H:%M:%S')} ===")
        
        for server in self.servers:
            is_healthy, message = self.check_server_health(server)
            
            if is_healthy:
                print(f"✅ {server['name']}: {message}")
                # Сброс счетчика неудачных проверок
                if server['name'] in self.failed_checks:
                    del self.failed_checks[server['name']]
            else:
                print(f"❌ {server['name']}: {message}")
                
                # Подсчет неудачных проверок
                self.failed_checks[server['name']] = self.failed_checks.get(server['name'], 0) + 1
                
                # Отправка алерта после N неудачных проверок
                threshold = server.get('alert_threshold', 3)
                if self.failed_checks[server['name']] >= threshold:
                    self.send_alert(server, message)
                    # Сброс, чтобы не спамить
                    self.failed_checks[server['name']] = 0
    
    def run(self, interval=60):
        """Запуск мониторинга"""
        print(f"🚀 Starting server monitoring (interval: {interval}s)")
        print(f"📊 Monitoring {len(self.servers)} servers")
        
        try:
            while True:
                self.run_monitoring_cycle()
                time.sleep(interval)
        except KeyboardInterrupt:
            print("\n👋 Monitoring stopped by user")

# Конфигурационный файл (servers.json)
config_example = {
    "servers": [
        {
            "name": "web-server-01",
            "host": "192.168.1.10",
            "health_url": "http://192.168.1.10:80/health",
            "port": 80,
            "timeout": 5,
            "alert_threshold": 3
        },
        {
            "name": "database-server",
            "host": "192.168.1.20",
            "port": 5432,
            "timeout": 10,
            "alert_threshold": 2
        }
    ],
    "alerts": {
        "enabled": False,  # Включить для реальных алертов
        "recipients": ["ops@company.com"],
        "smtp": {
            "host": "smtp.company.com",
            "port": 587,
            "use_tls": True,
            "from": "monitoring@company.com",
            "username": "monitoring@company.com",
            "password": "password"
        }
    }
}

# Использование
if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description="Server Health Monitor")
    parser.add_argument("--config", default="servers.json", help="Config file")
    parser.add_argument("--interval", type=int, default=60, help="Check interval (seconds)")
    parser.add_argument("--once", action="store_true", help="Run once and exit")
    
    args = parser.parse_args()
    
    # Создание примера конфигурации если файл не существует
    if not Path(args.config).exists():
        with open(args.config, 'w') as f:
            json.dump(config_example, f, indent=2)
        print(f"📝 Created example config: {args.config}")
        print("Edit the config file and run again")
        sys.exit(0)
    
    monitor = ServerMonitor(args.config)
    
    if args.once:
        monitor.run_monitoring_cycle()
    else:
        monitor.run(args.interval)
```

### Пример 2: Скрипт развертывания приложений

```python
#!/usr/bin/env python3
"""
Application Deployment Script
Automates application deployment with rollback capability
"""

import os
import sys
import json
import subprocess
import shutil
from datetime import datetime
from pathlib import Path

class ApplicationDeployer:
    def __init__(self, config_file):
        with open(config_file, 'r') as f:
            self.config = json.load(f)
        
        self.app_config = self.config['application']
        self.deployment_path = Path(self.app_config['deployment_path'])
        self.backup_path = Path(self.app_config['backup_path'])
        
        # Создание необходимых директорий
        self.deployment_path.mkdir(parents=True, exist_ok=True)
        self.backup_path.mkdir(parents=True, exist_ok=True)
    
    def run_command(self, command, cwd=None):
        """Выполнение команды с логированием"""
        print(f"🔧 Running: {command}")
        
        try:
            result = subprocess.run(
                command,
                shell=True,
                cwd=cwd,
                capture_output=True,
                text=True,
                timeout=300  # 5 минут timeout
            )
            
            if result.returncode != 0:
                print(f"❌ Command failed: {result.stderr}")
                return False, result.stderr
            
            if result.stdout:
                print(f"📝 Output: {result.stdout.strip()}")
            
            return True, result.stdout
            
        except subprocess.TimeoutExpired:
            print("⏰ Command timed out")
            return False, "Command timed out"
        except Exception as e:
            print(f"💥 Command error: {e}")
            return False, str(e)
    
    def create_backup(self):
        """Создание резервной копии"""
        if not self.deployment_path.exists():
            print("📁 No existing deployment to backup")
            return True
        
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        backup_dir = self.backup_path / f"backup_{timestamp}"
        
        print(f"💾 Creating backup: {backup_dir}")
        
        try:
            shutil.copytree(self.deployment_path, backup_dir)
            
            # Сохранение метаданных бэкапа
            metadata = {
                "created_at": timestamp,
                "source": str(self.deployment_path),
                "backup_path": str(backup_dir)
            }
            
            with open(backup_dir / "backup_metadata.json", 'w') as f:
                json.dump(metadata, f, indent=2)
            
            print(f"✅ Backup created: {backup_dir}")
            return True
            
        except Exception as e:
            print(f"❌ Backup failed: {e}")
            return False
    
    def download_artifact(self):
        """Скачивание артефакта приложения"""
        artifact_url = self.app_config['artifact_url']
        artifact_path = Path("/tmp") / "app_artifact.tar.gz"
        
        print(f"⬇️  Downloading artifact: {artifact_url}")
        
        success, output = self.run_command(
            f"curl -L -o {artifact_path} {artifact_url}"
        )
        
        if not success:
            return False, None
        
        return True, artifact_path
    
    def extract_artifact(self, artifact_path):
        """Извлечение артефакта"""
        extract_path = Path("/tmp") / "app_extract"
        
        print(f"📦 Extracting artifact to: {extract_path}")
        
        # Очистка директории извлечения
        if extract_path.exists():
            shutil.rmtree(extract_path)
        extract_path.mkdir()
        
        success, output = self.run_command(
            f"tar -xzf {artifact_path} -C {extract_path}"
        )
        
        return success, extract_path
    
    def deploy_application(self, source_path):
        """Развертывание приложения"""
        print(f"🚀 Deploying application from: {source_path}")
        
        # Остановка текущего приложения
        if 'stop_command' in self.app_config:
            print("⏹️  Stopping current application")
            self.run_command(self.app_config['stop_command'])
        
        # Копирование новых файлов
        try:
            if self.deployment_path.exists():
                shutil.rmtree(self.deployment_path)
            
            shutil.copytree(source_path, self.deployment_path)
            print(f"✅ Files deployed to: {self.deployment_path}")
            
        except Exception as e:
            print(f"❌ Deployment failed: {e}")
            return False
        
        # Выполнение команд после развертывания
        for command in self.app_config.get('post_deploy_commands', []):
            success, output = self.run_command(command, cwd=self.deployment_path)
            if not success:
                print(f"❌ Post-deploy command failed: {command}")
                return False
        
        # Запуск приложения
        if 'start_command' in self.app_config:
            print("▶️  Starting application")
            success, output = self.run_command(
                self.app_config['start_command'],
                cwd=self.deployment_path
            )
            if not success:
                return False
        
        return True
    
    def health_check(self):
        """Проверка здоровья приложения после развертывания"""
        if 'health_check_url' not in self.app_config:
            print("⚠️  No health check configured")
            return True
        
        import time
        import requests
        
        health_url = self.app_config['health_check_url']
        max_attempts = self.app_config.get('health_check_attempts', 5)
        wait_time = self.app_config.get('health_check_wait', 10)
        
        print(f"🏥 Running health check: {health_url}")
        
        for attempt in range(max_attempts):
            try:
                print(f"   Attempt {attempt + 1}/{max_attempts}")
                response = requests.get(health_url, timeout=10)
                
                if response.status_code == 200:
                    print("✅ Health check passed")
                    return True
                else:
                    print(f"   Status: {response.status_code}")
                    
            except Exception as e:
                print(f"   Error: {e}")
            
            if attempt < max_attempts - 1:
                print(f"   Waiting {wait_time}s before retry...")
                time.sleep(wait_time)
        
        print("❌ Health check failed")
        return False
    
    def rollback(self):
        """Откат к предыдущей версии"""
        backups = list(self.backup_path.glob("backup_*"))
        if not backups:
            print("❌ No backups available for rollback")
            return False
        
        # Найти последний бэкап
        latest_backup = max(backups, key=lambda p: p.stat().st_mtime)
        
        print(f"🔄 Rolling back to: {latest_backup}")
        
        try:
            # Остановка приложения
            if 'stop_command' in self.app_config:
                self.run_command(self.app_config['stop_command'])
            
            # Восстановление из бэкапа
            if self.deployment_path.exists():
                shutil.rmtree(self.deployment_path)
            
            shutil.copytree(latest_backup, self.deployment_path)
            
            # Исключение метаданных бэкапа
            metadata_file = self.deployment_path / "backup_metadata.json"
            if metadata_file.exists():
                metadata_file.unlink()
            
            # Запуск приложения
            if 'start_command' in self.app_config:
                success, output = self.run_command(
                    self.app_config['start_command'],
                    cwd=self.deployment_path
                )
                if not success:
                    return False
            
            print("✅ Rollback completed")
            return True
            
        except Exception as e:
            print(f"❌ Rollback failed: {e}")
            return False
    
    def deploy(self):
        """Полный процесс развертывания"""
        print("🚀 Starting deployment process")
        
        # 1. Создание бэкапа
        if not self.create_backup():
            print("❌ Deployment aborted: backup failed")
            return False
        
        # 2. Скачивание артефакта
        success, artifact_path = self.download_artifact()
        if not success:
            print("❌ Deployment aborted: artifact download failed")
            return False
        
        # 3. Извлечение артефакта
        success, extract_path = self.extract_artifact(artifact_path)
        if not success:
            print("❌ Deployment aborted: artifact extraction failed")
            return False
        
        # 4. Развертывание
        if not self.deploy_application(extract_path):
            print("❌ Deployment failed, attempting rollback...")
            self.rollback()
            return False
        
        # 5. Проверка здоровья
        if not self.health_check():
            print("❌ Health check failed, attempting rollback...")
            self.rollback()
            return False
        
        print("🎉 Deployment completed successfully!")
        
        # Очистка временных файлов
        try:
            artifact_path.unlink()
            shutil.rmtree(extract_path)
        except:
            pass
        
        return True

# Пример конфигурации развертывания
deployment_config = {
    "application": {
        "name": "my-web-app",
        "deployment_path": "/opt/my-app",
        "backup_path": "/opt/backups/my-app",
        "artifact_url": "https://github.com/user/repo/releases/download/v1.0.0/app.tar.gz",
        "stop_command": "sudo systemctl stop my-app",
        "start_command": "sudo systemctl start my-app",
        "post_deploy_commands": [
            "chmod +x start.sh",
            "chown -R app:app .",
            "pip install -r requirements.txt"
        ],
        "health_check_url": "http://localhost:8080/health",
        "health_check_attempts": 5,
        "health_check_wait": 10
    }
}

# Использование
if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description="Application Deployer")
    parser.add_argument("--config", default="deploy.json", help="Config file")
    parser.add_argument("--rollback", action="store_true", help="Rollback to previous version")
    parser.add_argument("--health-check", action="store_true", help="Run health check only")
    
    args = parser.parse_args()
    
    # Создание конфигурации если не существует
    if not Path(args.config).exists():
        with open(args.config, 'w') as f:
            json.dump(deployment_config, f, indent=2)
        print(f"📝 Created example config: {args.config}")
        sys.exit(0)
    
    deployer = ApplicationDeployer(args.config)
    
    if args.rollback:
        success = deployer.rollback()
    elif args.health_check:
        success = deployer.health_check()
    else:
        success = deployer.deploy()
    
    sys.exit(0 if success else 1)
```

### 🎯 Задание 5: Создание DevOps скрипта
```python
# Создайте файл log_analyzer.py - скрипт анализа логов

#!/usr/bin/env python3
"""
Log Analyzer for DevOps
Analyzes web server logs and generates reports
"""

import re
import sys
import json
import argparse
from datetime import datetime, timedelta
from collections import Counter, defaultdict
from pathlib import Path

class LogAnalyzer:
    def __init__(self):
        # Паттерны для парсинга различных типов логов
        self.patterns = {
            'nginx': re.compile(
                r'(?P<ip>\d+\.\d+\.\d+\.\d+) - - \[(?P<datetime>[^\]]+)\] '
                r'"(?P<method>\w+) (?P<url>[^\s]+) HTTP/[^\s]+" '
                r'(?P<status>\d+) (?P<size>\d+|-) "(?P<referer>[^"]*)" "(?P<user_agent>[^"]*)"'
            ),
            'apache': re.compile(
                r'(?P<ip>\d+\.\d+\.\d+\.\d+) - - \[(?P<datetime>[^\]]+)\] '
                r'"(?P<method>\w+) (?P<url>[^\s]+) HTTP/[^\s]+" '
                r'(?P<status>\d+) (?P<size>\d+|-)'
            )
        }
        
        self.stats = {
            'total_requests': 0,
            'unique_ips': set(),
            'status_codes': Counter(),
            'methods': Counter(),
            'top_pages': Counter(),
            'hourly_requests': defaultdict(int),
            'error_requests': [],
            'large_responses': [],
            'suspicious_ips': Counter()
        }
    
    def parse_log_line(self, line, log_format='nginx'):
        """Парсинг строки лога"""
        pattern = self.patterns.get(log_format)
        if not pattern:
            return None
        
        match = pattern.match(line.strip())
        if not match:
            return None
        
        data = match.groupdict()
        
        # Парсинг даты
        try:
            # Формат: 01/Jan/2024:12:00:00 +0000
            dt_str = data['datetime'].split(' ')[0]  # Убираем timezone
            data['parsed_datetime'] = datetime.strptime(dt_str, '%d/%b/%Y:%H:%M:%S')
        except:
            data['parsed_datetime'] = None
        
        # Преобразование типов
        try:
            data['status'] = int(data['status'])
        except:
            data['status'] = 0
        
        try:
            data['size'] = int(data['size']) if data['size'] != '-' else 0
        except:
            data['size'] = 0
        
        return data
    
    def analyze_log_file(self, log_file, log_format='nginx'):
        """Анализ файла логов"""
        print(f"📊 Analyzing log file: {log_file}")
        
        try:
            with open(log_file, 'r') as f:
                for line_num, line in enumerate(f, 1):
                    data = self.parse_log_line(line, log_format)
                    
                    if not data:
                        continue
                    
                    self.process_log_entry(data)
                    
                    # Прогресс каждые 10000 строк
                    if line_num % 10000 == 0:
                        print(f"   Processed {line_num} lines...")
            
            print(f"✅ Processed {line_num} lines total")
            
        except FileNotFoundError:
            print(f"❌ Log file not found: {log_file}")
            return False
        except Exception as e:
            print(f"❌ Error analyzing log: {e}")
            return False
        
        return True
    
    def process_log_entry(self, data):
        """Обработка отдельной записи лога"""
        self.stats['total_requests'] += 1
        self.stats['unique_ips'].add(data['ip'])
        self.stats['status_codes'][data['status']] += 1
        self.stats['methods'][data['method']] += 1
        self.stats['top_pages'][data['url']] += 1
        
        # Анализ по часам
        if data['parsed_datetime']:
            hour = data['parsed_datetime'].hour
            self.stats['hourly_requests'][hour] += 1
        
        # Поиск ошибок (4xx, 5xx)
        if data['status'] >= 400:
            self.stats['error_requests'].append({
                'ip': data['ip'],
                'status': data['status'],
                'url': data['url'],
                'datetime': data['datetime']
            })
        
        # Большие ответы (>1MB)
        if data['size'] > 1024 * 1024:
            self.stats['large_responses'].append({
                'ip': data['ip'],
                'size': data['size'],
                'url': data['url']
            })
        
        # Подозрительная активность (много запросов с одного IP)
        self.stats['suspicious_ips'][data['ip']] += 1
    
    def generate_report(self, output_file=None):
        """Генерация отчета"""
        report = []
        
        # Заголовок
        report.append("="*50)
        report.append("WEB SERVER LOG ANALYSIS REPORT")
        report.append("="*50)
        report.append(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        report.append("")
        
        # Общая статистика
        report.append("📈 GENERAL STATISTICS")
        report.append("-" * 20)
        report.append(f"Total requests: {self.stats['total_requests']:,}")
        report.append(f"Unique IPs: {len(self.stats['unique_ips']):,}")
        report.append("")
        
        # Топ статус коды
        report.append("📊 STATUS CODES")
        report.append("-" * 15)
        for status, count in self.stats['status_codes'].most_common(10):
            percentage = (count / self.stats['total_requests']) * 100
            status_name = self.get_status_name(status)
            report.append(f"  {status} ({status_name}): {count:,} ({percentage:.1f}%)")
        report.append("")
        
        # HTTP методы
        report.append("🔧 HTTP METHODS")
        report.append("-" * 15)
        for method, count in self.stats['methods'].most_common():
            percentage = (count / self.stats['total_requests']) * 100
            report.append(f"  {method}: {count:,} ({percentage:.1f}%)")
        report.append("")
        
        # Топ страницы
        report.append("📄 TOP PAGES")
        report.append("-" * 10)
        for url, count in self.stats['top_pages'].most_common(15):
            report.append(f"  {count:,} - {url}")
        report.append("")
        
        # Активность по часам
        report.append("⏰ HOURLY ACTIVITY")
        report.append("-" * 16)
        for hour in range(24):
            count = self.stats['hourly_requests'][hour]
            bar = "█" * (count // max(1, max(self.stats['hourly_requests'].values()) // 20))
            report.append(f"  {hour:02d}:00 {count:6,} |{bar}")
        report.append("")
        
        # Ошибки
        error_count = len(self.stats['error_requests'])
        if error_count > 0:
            report.append(f"🚨 ERRORS ({error_count:,} total)")
            report.append("-" * 15)
            
            # Группировка ошибок по статус коду
            error_by_status = defaultdict(int)
            for error in self.stats['error_requests']:
                error_by_status[error['status']] += 1
            
            for status, count in sorted(error_by_status.items()):
                report.append(f"  {status}: {count:,}")
            
            # Топ ошибок
            report.append("\nTop error URLs:")
            error_urls = Counter(error['url'] for error in self.stats['error_requests'])
            for url, count in error_urls.most_common(10):
                report.append(f"  {count:,} - {url}")
            report.append("")
        
        # Подозрительные IP
        suspicious = [(ip, count) for ip, count in self.stats['suspicious_ips'].most_common(20) 
                     if count > 1000]  # Более 1000 запросов
        
        if suspicious:
            report.append(f"🔍 SUSPICIOUS IPs ({len(suspicious)} found)")
            report.append("-" * 20)
            for ip, count in suspicious:
                report.append(f"  {ip}: {count:,} requests")
            report.append("")
        
        # Большие ответы
        if self.stats['large_responses']:
            report.append(f"📦 LARGE RESPONSES ({len(self.stats['large_responses'])} found)")
            report.append("-" * 20)
            for resp in sorted(self.stats['large_responses'], 
                             key=lambda x: x['size'], reverse=True)[:10]:
                size_mb = resp['size'] / (1024 * 1024)
                report.append(f"  {size_mb:.1f}MB - {resp['url']} ({resp['ip']})")
            report.append("")
        
        # Рекомендации
        report.append("💡 RECOMMENDATIONS")
        report.append("-" * 15)
        
        if error_count > self.stats['total_requests'] * 0.05:  # >5% ошибок
            report.append("  • High error rate detected - investigate server issues")
        
        if suspicious:
            report.append("  • Suspicious IPs detected - consider rate limiting")
        
        if self.stats['large_responses']:
            report.append("  • Large responses detected - check for optimization opportunities")
        
        # Сохранение отчета
        report_text = "\n".join(report)
        
        if output_file:
            with open(output_file, 'w') as f:
                f.write(report_text)
            print(f"📄 Report saved to: {output_file}")
        else:
            print(report_text)
        
        return report_text
    
    def get_status_name(self, status):
        """Получить название статус кода"""
        status_names = {
            200: "OK", 201: "Created", 204: "No Content",
            301: "Moved Permanently", 302: "Found", 304: "Not Modified",
            400: "Bad Request", 401: "Unauthorized", 403: "Forbidden", 
            404: "Not Found", 405: "Method Not Allowed",
            500: "Internal Server Error", 502: "Bad Gateway", 
            503: "Service Unavailable", 504: "Gateway Timeout"
        }
        return status_names.get(status, "Unknown")
    
    def export_json(self, output_file):
        """Экспорт статистики в JSON"""
        export_data = {
            'total_requests': self.stats['total_requests'],
            'unique_ips': len(self.stats['unique_ips']),
            'status_codes': dict(self.stats['status_codes']),
            'methods': dict(self.stats['methods']),
            'top_pages': dict(self.stats['top_pages'].most_common(50)),
            'hourly_requests': dict(self.stats['hourly_requests']),
            'error_count': len(self.stats['error_requests']),
            'suspicious_ips': dict(self.stats['suspicious_ips'].most_common(100)),
            'generated_at': datetime.now().isoformat()
        }
        
        with open(output_file, 'w') as f:
            json.dump(export_data, f, indent=2)
        
        print(f"📊 Statistics exported to: {output_file}")

def create_sample_log():
    """Создание примера лога для тестирования"""
    sample_log = """192.168.1.1 - - [01/Jan/2024:12:00:01 +0000] "GET / HTTP/1.1" 200 1234 "-" "Mozilla/5.0"
192.168.1.2 - - [01/Jan/2024:12:00:02 +0000] "GET /api/users HTTP/1.1" 200 5678 "-" "curl/7.68.0"
192.168.1.1 - - [01/Jan/2024:12:00:03 +0000] "POST /login HTTP/1.1" 401 567 "-" "Mozilla/5.0"
192.168.1.3 - - [01/Jan/2024:12:00:04 +0000] "GET /admin HTTP/1.1" 403 123 "-" "BadBot/1.0"
192.168.1.1 - - [01/Jan/2024:12:00:05 +0000] "GET /nonexistent HTTP/1.1" 404 456 "-" "Mozilla/5.0"
10.0.0.100 - - [01/Jan/2024:12:00:06 +0000] "GET /health HTTP/1.1" 200 50 "-" "HealthCheck/1.0"
192.168.1.4 - - [01/Jan/2024:12:00:07 +0000] "GET /large-file.zip HTTP/1.1" 200 1048576 "-" "wget/1.20.3"
192.168.1.1 - - [01/Jan/2024:12:00:08 +0000] "GET / HTTP/1.1" 500 789 "-" "Mozilla/5.0"
"""

    with open("sample.log", "w") as f:
        # Создаем больше данных для интересного анализа
        for i in range(100):
            f.write(sample_log)
    
    print("📝 Created sample.log for testing")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Web Server Log Analyzer")
    parser.add_argument("logfile", nargs='?', help="Log file to analyze")
    parser.add_argument("--format", choices=['nginx', 'apache'], default='nginx', 
                       help="Log format")
    parser.add_argument("--output", help="Output report file")
    parser.add_argument("--json", help="Export statistics as JSON")
    parser.add_argument("--create-sample", action="store_true", 
                       help="Create sample log file")
    
    args = parser.parse_args()
    
    if args.create_sample:
        create_sample_log()
        sys.exit(0)
    
    if not args.logfile:
        print("❌ Please specify a log file to analyze")
        print("Use --create-sample to create a test log file")
        sys.exit(1)
    
    analyzer = LogAnalyzer()
    
    if analyzer.analyze_log_file(args.logfile, args.format):
        analyzer.generate_report(args.output)
        
        if args.json:
            analyzer.export_json(args.json)
    else:
        sys.exit(1)

# Для запуска:
# python log_analyzer.py --create-sample
# python log_analyzer.py sample.log --output report.txt --json stats.json
```

---

## 🎓 Итоговое задание: Комплексный DevOps проект

Создайте полный DevOps проект, объединяющий все изученные концепции:

```python
# Создайте файл devops_dashboard.py - комплексная система мониторинга

#!/usr/bin/env python3
"""
DevOps Monitoring Dashboard
Comprehensive monitoring system combining all learned concepts
"""

import requests
import json
import time
import threading
from datetime import datetime, timedelta
from pathlib import Path
from collections import defaultdict

class DevOpsDashboard:
    def __init__(self, config_file="dashboard_config.json"):
        self.config = self.load_config(config_file)
        self.metrics = {
            'services': {},
            'apis': {},
            'system': {},
            'alerts': []
        }
        self.running = False
    
    def load_config(self, config_file):
        """Загрузка конфигурации"""
        default_config = {
            "monitoring": {
                "interval": 60,
                "services": [
                    {"name": "pokemon-api", "url": "https://pokeapi.co/api/v2/pokemon/1"},
                    {"name": "json-placeholder", "url": "https://jsonplaceholder.typicode.com/posts/1"},
                    {"name": "countries-api", "url": "https://restcountries.com/v3.1/name/germany"}
                ],
                "thresholds": {
                    "response_time": 2.0,
                    "error_rate": 0.05
                }
            },
            "alerts": {
                "enabled": True,
                "webhook_url": None
            },
            "dashboard": {
                "refresh_rate": 30,
                "history_size": 100
            }
        }
        
        if Path(config_file).exists():
            with open(config_file, 'r') as f:
                return json.load(f)
        else:
            with open(config_file, 'w') as f:
                json.dump(default_config, f, indent=2)
            return default_config
    
    def monitor_service(self, service):
        """Мониторинг отдельного сервиса"""
        try:
            start_time = time.time()
            response = requests.get(service['url'], timeout=10)
            response_time = time.time() - start_time
            
            service_metrics = {
                'name': service['name'],
                'status': 'UP' if response.status_code == 200 else 'DOWN',
                'status_code': response.status_code,
                