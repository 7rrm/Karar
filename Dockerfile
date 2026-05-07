FROM python:3.10-slim-buster

# تثبيت git والاعتماديات الأساسية
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# clonning repo 
RUN git clone https://github.com/7rrm/arras.git /root/JoKeRUB

# working directory 
WORKDIR /root/JoKeRUB

# Install requirements
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
RUN pip3 install --no-cache-dir -r requirements.txt

# ENV PATH="/home/JoKeRUB/bin:$PATH"  # علِّق هذا السطر - مساره خطأ

CMD ["python3","-m","JoKeRUB"]
