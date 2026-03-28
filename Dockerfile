FROM Ksidhdnkddbos/jepthon:slim-buster

# clonning repo 
RUN git clone https://github.com/Ksidhdnkddbos/jepthon.git /root/JoKeRUB
WORKDIR /root/JoKeRUB

# تثبيت Node.js 20 (الإصدار المدعوم)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    node --version && \
    npm --version

# تحديث yt-dlp مع تفعيل EJS
RUN pip3 install --no-cache-dir -U yt-dlp[default] yt-dlp-ejs

# تثبيت باقي المتطلبات
RUN pip3 install --no-cache-dir -r requirements.txt

ENV PATH="/home/JoKeRUB/bin:$PATH"

CMD ["python3","-m","JoKeRUB"]
