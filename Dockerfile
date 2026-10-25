FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY service ./service

EXPOSE 8080

CMD ["sh", "-c", "gunicorn --workers=1 --bind 0.0.0.0:${PORT} --log-level=info service:app"]
