FROM ubuntu
USER root
RUN apt-get update -qq
RUN apt-get -y install python3.6
RUN apt-get -qqy install python3-pip
RUN set -xe \
    && apt-get update \
    && apt-get install python-pip
RUN pip install --upgrade pip
ADD . /simpleApp
WORKDIR /simpleApp
RUN pip install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]
