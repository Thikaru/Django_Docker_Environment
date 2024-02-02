# python version number:3.9.16
FROM python:3.9.16
ENV PYTHONUNBUFFERED 1
ARG WORKDIR
# code ... directory for python codes.
WORKDIR ${WORKDIR:-/code}
# copy localcode to container image.
COPY ./infra/django ${WORKDIR:-/code}
# apt 
RUN apt-get update && apt-get install -y \
	libgl1-mesa-glx
# upgrade pip command
RUN pip install --upgrade pip
# install python lib 
RUN pip install -r requirements.txt