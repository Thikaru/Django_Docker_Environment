# イメージ名にpython3の実行環境のイメージを指定
FROM python:3
ENV PYTHONUNBUFFERED 1
# コンテナ内に /code というディレクトリを作成する
# codeディレクトリを作成し、作業ディレクトリをcodeディレクトリに移動しています。
RUN mkdir /code
RUN mkdir /code/backend
# 指定したディレクトリ（/code）をルートディレクトリにする
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
	&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq \
	&& apt-get install -y --no-install-recommends \
	yarn \
	nodejs \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /code/backend
# ビルドコンテキスト上に存在するrequirements.txtをコンテナ内のcodeディレクトリ内に置き、RUN pip install -r requirements.txtでpipインストールを実行しています。
# pip installコマンドは、-rで指定した、requirements.txtに記載されているパッケージのインストールを実行します。
# rewuirements.txtは、この後ビルドコンテキスト内に作成しますが、このファイルにはDjango
COPY ./infra/python/requirements.txt /code/backend
# RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# ビルドコンテキストの内容をすべて/code内に置いています。
# COPY . /code/