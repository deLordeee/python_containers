FROM python:3.10-slim

# Створюємо робочий каталог
WORKDIR /app

# Копіюємо requirements
COPY requirements.txt .

# Встановлюємо залежності
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо увесь код проєкту
COPY . .

# Відкриваємо порт (необов’язково, але гарно мати)
EXPOSE 8080

# Команда запуску
CMD ["uvicorn", "spaceship.main:app", "--host", "0.0.0.0", "--port", "8080"]
