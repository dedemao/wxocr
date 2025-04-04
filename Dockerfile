FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

RUN pip install flask

COPY wcocr.cpython-312-x86_64-linux-gnu.so /app/wcocr.cpython-312-x86_64-linux-gnu.so

COPY wx /app/wx

COPY templates /app/templates

COPY main.py /app/main.py

RUN chmod +x /app/wx/opt/wechat/wxocr

WORKDIR /app

CMD ["python", "main.py"]
