# Docker Django 環境構築

#### [TopPage へ](../README.md)

## Web アプリ詳細

## 初期設定流れ(Django のプロジェクトがないところからやった場合)

```shell
# とりあえずbuild
docker-compose build
# その後,Dockerプロジェクトをappコンテナ内で作成する
docker compose run app django-admin startproject <プロジェクト名>
# 下記コマンド実行でアプリが起動したことをWebページURLにアクセスして確認する
docker-compose up
# MySQLとの接続を行うために一度コンテナ落とす
docker-compose down -v
# 設定情報に関しての部分の，DjangoとDBの設定情報を記入する．その後下記を実行
# migrateによりデフォルトで設定されているテーブル定義を実行する
docker-compose up
docker-compose exec app python manage.py migrate
```

## このプロジェクト起動時に行う順番

```shell
# アプリが起動したことをWebページURLにアクセスして確認する
docker-compose up
# MySQLとの接続を行うために一度コンテナ落とす
docker-compose down -v
# 設定情報に関しての部分の，DjangoとDBの設定情報を記入する．その後下記を実行
# migrateによりデフォルトで設定されているテーブル定義を実行する
docker-compose up
docker-compose exec app python manage.py migrate
```

## 「requirements.txt」を更新・新しいインストールをする場合について

Docker 環境内に，新規でライブラリを追加したり，ライブラリを更新したくなることが開発を進めているとあると思う．その時に下記のリンクを読んで欲しい．

## アプリの作成方法(resize_image 作成時で説明)

```shell
docker-compose exec app python manage.py startapp resize_images

## 一般的構文
docker-compose exec app python manage.py startapp <アプリ名>
```

### アプリ作成時の流れ

```shell
docker-compose exec app python manage.py startapp resize_images

## 一般的構文
docker-compose exec app python manage.py startapp <アプリ名>

## Dockerコンテナないで行う場合（Dockerを使用しない場合）
python manage.py startapp <アプリ名>
```

#### 作成後にやること

「settings.py」の「INSTALLED_APPS」に記述する．記述の仕方は，作成されたアプリケーションフォルダの相対パスで「resize_images」であれば，「resize_images」フォルダの「apps.py」の中の「ResizeImagesConfig」のクラスを読み込みたいので「resize_images.apps.ResizeImagesConfig」と記入する．もしくは，「'resize_images'」とアプリケーションフォルダ名のみを書いても良い

```Python
INSTALLED_APPS = [
	# 'resize_images', または
		'resize_images.apps.ResizeImagesConfig' # どちらかを追加
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
]
```

## モデルについて

### モデルの定義の方法

1. <アプリディレクトリ>/models.py にモデルを定義
2. manage.py makemigrations コマンドにより，マイグレーションファイルを生成
3. manage.py migrate コマンドにより，マイグレーションファイルから SQL を発行しテーブルを作成

## 設定情報に関して

### ローカル情報

- Web ページ URL：[http://localhost:8100](http://localhost:8100)
- phpMyAdminURL：[http://127.0.0.1:8999](http://127.0.0.1:8999)

### Django と MySQL の接続に関して．

※MySQL サーバが起動前に app の Django が起動して接続処理してうまく接続できないことがある．エラー・バグリストに修正方法を載せる予定なので確認ください．もしくは Docker コンテナを Restart させるなどで動くと思います．

#### docker-compose.yml に記述している内容

```Docker
environment:
	TZ: 'Asia/Tokyo'
	MYSQL_ROOT_PASSWORD: root
	MYSQL_DATABASE: 'django'
	MYSQL_USER: 'django'
	MYSQL_PASSWORD: 'django'
	MYSQL_ALLOW_EMPTY_PASSWORD: 'true'
```

#### Django プロジェクトの「settings.py」を下記のように変更する

```Python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'django',
        'USER': 'root',
        'PASSWORD': 'root',
        'HOST': 'db',
        'PORT': '3306',
    }
}
```

## Docker コマンド

# Docker を使うための小知識

#### [本研究自動彩色 Web アプリ詳細に戻る](../README.md)

## Docker とは? DockerCompose とは？

### Docker build とは？

```shell
docker-compose build
[キャッシュを使いたくない場合]
docker-compose build --no-cache
```

### Docker up とは？

```shell
docker-compose up
[新しいサービスを立ち上げる場合など]
docker-compose up --build
[一般的にバックグラウンドで使う「-d」オプションで]
```

up コマンドは，キャッシュのある場合は，それを使って 1 発でイメージの構築からコンテナの構築・起動まで行う．
キャッシュがない場合は，「--build」オプションをつけることで，イメージの構築からコンテナの構築・起動までしてくれる．

### Docker start とは

既存のコンテナを起動する．
「stop」コマンドで停止することができる

```shell
docker-compose start
```

### Docker run とは

run コマンドでは image の構築から，コンテナの構築・起動までしてくれますが，引数でサービスを指定しないと失敗します．

```shell
docker-compose run web

「run」コマンドを介して指定したサービスのコンテナ内でコマンドを実行できる
docker-compose run web rails new
```

### Docker exec とは

run のついでですが，サービスのコンテナ内でコマンドを実行するなら exec コマンドも便利です．
docker exec コマンドと同じで起動中のコンテナのシェルへ接続することができるので，run よりもこちらで実行したほうが早いです．

```shell
docker-compose exec web /bin/bash
```

## DockerFile を本番環境に簡単にあげれるようにするために，「env」ファイルを使用

「.env」と「.env.example」で「.env-production.env」を追加しています．「.env」ファイルは，「.gitignore」に登録されているので，自分で使用する環境に，ローカルの場合は，「.env.example」の中身をコピーして「.env」ファイルを作成してください．「.env-production.env」の中身をコピーして「.env」ファイルを作成してください．

```
<envファイル>
WORKDIR=/code

<Dockerファイルでの書き方>
// ${envにファイルに書かれた変数:-(なかった時のためのデフォルト値)}
${WORKDIR:-/code}
```

## 参考・参照

1. [docker-compose 'up' とか 'build' とか 'start' とかの違いを理解できていなかったのでまとめてみた](https://qiita.com/tegnike/items/bcdcee0320e11a928d46) [- 2024 年 1 月アクセス]
2. []() [- 2024 年 1 月アクセス]
3. []() [- 2024 年 1 月アクセス]
4. []() [- 2024 年 1 月アクセス]

### 参考・参照文献

1. [Docker で Django プロジェクトを作って Docker で動かす](https://qiita.com/tubutubu_mustard/items/9dea37856042f91d700e)[ - 2024 年 1 月アクセス]：image をビルドしてからであれば，docker の run コマンドを使える．それを使って Django プロジェクトを作成することがわかった．
2. [《滅びの呪文》Docker Compose で作ったコンテナ、イメージ、ボリューム、ネットワークを一括完全消去する便利コマンド](https://qiita.com/suin/items/19d65e191b96a0079417)[ - 2024 年 1 月アクセス]：Docker のコンテナ・イメージ・ボリューム・ネットワークを一括削除するコマンドを知れた．
3. [django と mysql を docker-compose で動かす【docker-compose,django,mysql】](https://docker.hatenablog.jp/entry/2023/05/12/212955)[ - 2024 年 1 月アクセス]：Docker×Django の環境構築で一番参考にした資料
4. [Docker Django 環境でお世話になった Github](https://github.com/minegishirei/PythonImages/tree/main/django_mysql)[ - 2024 年 1 月アクセス]：
