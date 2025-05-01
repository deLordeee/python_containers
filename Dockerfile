FROM python:3.10-alpine

WORKDIR /app

# Встановлюємо компілятори для numpy
RUN apk add --no-cache gcc musl-dev linux-headers

COPY requirements-freeze.txt .
RUN pip install --no-cache-dir -r requirements-freeze.txt
RUN apk del gcc musl-dev linux-headers  # Видалити компілятори після встановлення залежностей
RUN rm -rf /var/cache/apk/*   
COPY spaceship/ spaceship/
COPY build/ build/

CMD ["uvicorn", "spaceship.main:app", "--host", "0.0.0.0", "--port", "8080"]