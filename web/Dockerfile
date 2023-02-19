FROM python:3.9

ARG DJANGO_SERVER_PORT
ENV DJANGO_SERVER_PORT $DJANGO_SERVER_PORT

WORKDIR /my-admin
COPY . /my-admin
RUN pip install --no-cache-dir -r requirements.txt
ENV DJANGO_SETTINGS_MODULE=my-admin.settings

EXPOSE $DJANGO_SERVER_PORT

CMD python manage.py runserver 0.0.0.0:$DJANGO_SERVER_PORT
