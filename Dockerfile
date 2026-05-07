FROM python:3.10-slim-bookworm

# تحديث قائمة الحزم وتثبيت كل الاعتماديات اللازمة للبناء (Build Dependencies)
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    gcc \
    g++ \
    make \
    libpq-dev \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# نسخ ملف المتطلبات أولاً للاستفادة من الـ Cache
COPY requirements.txt .

# استبدال psycopg2 بـ psycopg2-binary لتجنب أخطاء البناء
RUN sed -i 's/psycopg2/psycopg2-binary/g' requirements.txt && \
    pip install --no-cache-dir --default-timeout=100 -r requirements.txt

# نسخ باقي ملفات المشروع
COPY . .

# الأمر النهائي لتشغيل البوت
CMD ["python3", "-m", "JoKeRUB"]
