FROM python:3.12

RUN apt-get update \
    && apt-get install -y wget \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && rm get-pip.py

RUN python -m pip install Django

RUN mkdir /build
ADD ./app.py /build/
WORKDIR /build

### Node Vars
ENV APP_BASEDIR /app
ENV APP_PORT 8000

# Install App
RUN mkdir ${APP_BASEDIR}
WORKDIR ${APP_BASEDIR}
COPY . /app

# ports
EXPOSE ${APP_PORT}

# executable
CMD ["python", "app.py", "runserver", "0.0.0.0:8000"]
