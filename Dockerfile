FROM python:3.12-slim

RUN apt update && apt upgrade -y

ENV TZ=Asia/Tokyo

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata

RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && dpkg-reconfigure -f coninteractive tzdata

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0

COPY requirements.txt /workspace/

WORKDIR /workspace