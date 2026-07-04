FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    make \
    default-libmysqlclient-dev \
    libpq-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libpangoft2-1.0-0 \
    libxcb1 \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

WORKDIR /app

EXPOSE 8000

CMD ["python", "Proyecto_GP4/manage.py", "runserver", "0.0.0.0:8000"]