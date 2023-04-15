FROM python:3.11
RUN apt-get update && apt-get install -y python python-pip
RUN python -m pip install Django
COPY app.py /opt/
EXPOSE 8000
CMD ["python", "app.py", "runserver", "0.0.0.0:8000"]
