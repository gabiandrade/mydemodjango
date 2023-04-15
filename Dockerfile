FROM python:3.11

RUN python -m pip install Django

# Define o diretório de trabalho
WORKDIR /workspace

# Copia o código da aplicação para o diretório de trabalho
COPY . /workspace

# Inicia a aplicação
CMD ["python", "app.py", "runserver", "0.0.0.0:8000"]
