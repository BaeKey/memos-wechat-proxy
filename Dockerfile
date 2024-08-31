FROM python:3.6.8-alpine

RUN mkdir /app /config

COPY memos.py /app/
COPY requirements.txt /app/

RUN pip install -r /app/requirements.txt && \
    rm -f /app/requirements.txt

WORKDIR /app

CMD ["python3", "memos.py"]
