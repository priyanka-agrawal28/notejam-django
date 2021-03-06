#We use an official Python v3.6 as the base/parent image 
FROM python:2.7.17-buster

#Set the appropriate environment variable to ensure that the standard input, standard output and standard error are set directly to the console without buffering 
ENV PYTHONUNBUFFERED 1

#Set the absolute path of your application
ENV APP_HOME /usr/src/app

#Copy the contents of your app to a directory in container
COPY notejam /usr/src/app

#Set the current working directory of the container
WORKDIR $APP_HOME

COPY requirements.txt .

EXPOSE 8000

RUN pip install -r requirements.txt && pip install psycopg2

CMD python manage.py syncdb && python manage.py migrate && python manage.py runserver 0.0.0.0:8000
