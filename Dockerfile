FROM python:3.11 as builder-djangoapp

RUN apt-get update \
    && apt-get install -y wget \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && rm get-pip.py

RUN mkdir /build
ADD ./app.py /build/
WORKDIR /build
RUN PYTHONPATH=/build py app.py runserver

### Node Vars
ENV APPUSER appuser
ENV UIDGID 1001
ENV APP_BASEDIR /app
ENV APP_PORT 8000

# Install App
RUN mkdir ${APP_BASEDIR}
WORKDIR ${APP_BASEDIR}
COPY --from=builder-djangoapp /build/server .

# Change Owner
RUN chown -R ${APPUSER}. ${APP_BASEDIR}

# Set User
USER ${APPUSER}

# ports
EXPOSE ${APP_PORT}

# executable
CMD ["python", "app.py", "runserver", "0.0.0.0:8000"]
