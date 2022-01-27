FROM python:3.8

RUN pip install --upgrade pip

WORKDIR /app/

COPY requirements.txt /app/

RUN pip --no-cache-dir install -r requirements.txt

COPY . /app/

EXPOSE 9090

CMD ["python", "web.py"]
