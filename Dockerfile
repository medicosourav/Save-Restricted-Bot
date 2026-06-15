FROM python:3.11
WORKDIR /app
ENV PYTHONUNBUFFERED=1

COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . /app
CMD ["sh", "-c", "python app.py & python main.py"]
