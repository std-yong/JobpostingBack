# set base image
FROM python:3.10.2

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV CHOKIDAR_USEPOLLING true
ENV DJANGO_SETTINGS_MODULE config.local_settings

# set work directory
WORKDIR /code

# install dependencies
COPY requirements.txt ./
RUN python3 -m pip install --upgrade pip setuptools
RUN pip install -r requirements.txt

# Copy project
COPY . ./

# Expose application port
EXPOSE 8000

# Start server
CMD ["gunicorn", "--bind", ":8000", "config.wsgi:application"]
