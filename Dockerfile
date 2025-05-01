FROM python:3.10-alpine

WORKDIR /app

COPY requirements-freeze.txt .
RUN apk add --no-cache build-base \
    && pip install --no-cache-dir -r requirements-freeze.txt

COPY . .

CMD ["uvicorn", "spaceship.main:app", "--host", "0.0.0.0", "--port", "8080"]