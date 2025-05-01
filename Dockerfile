FROM python:3.10-slim

WORKDIR /app

COPY requirements-freeze.txt .
RUN pip install --no-cache-dir -r requirements-freeze.txt

COPY spaceship/ spaceship/
COPY build/ build/
COPY . .

CMD ["uvicorn", "spaceship.main:app", "--host", "0.0.0.0", "--port", "8080"]
