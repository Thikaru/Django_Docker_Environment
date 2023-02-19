# イメージ名にpython3の実行環境のイメージを指定
FROM python:3
ENV PYTHONUNBUFFERED 1
# コンテナ内に /code というディレクトリを作成する
# codeディレクトリを作成し、作業ディレクトリをcodeディレクトリに移動しています。
RUN mkdir /code
# 指定したディレクトリ（/code）をルートディレクトリにする
WORKDIR /code
# ビルドコンテキスト上に存在するrequirements.txtをコンテナ内のcodeディレクトリ内に置き、RUN pip install -r requirements.txtでpipインストールを実行しています。
# pip installコマンドは、-rで指定した、requirements.txtに記載されているパッケージのインストールを実行します。
# rewuirements.txtは、この後ビルドコンテキスト内に作成しますが、このファイルにはDjango
COPY requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# ビルドコンテキストの内容をすべて/code内に置いています。
COPY . /code/