# Django Docker Template

#### [TopPage へ](../README.md)

```
mkdir backend

```

1. このプロジェクトをクローンする．
2. Docker 環境で実行したい Docker プロジェクトを backend に配置する．または，そのディレクトリに移動して新規作成する．
3. 「docker-compose.yml」があるディレクトリで「docker-compose build」コマンドで Docker コンテナを作成
4. その後初めての場合は Django のプロジェクトがないのでコンテナを起動しながらプロジェクトを作成する「docker-compose run web django-admin.py startproject <作成したいプロジェクト名> .」を行う．それ以外で作成後の起動もしくは backend に Djangp プロジェクトを持っていく場合は「docker-compose up」でコンテナを起動する
5. djangopj/settings.py を開き下の記述する内容のように DB の設定を変更する
6. アクセスできるかを確認する．

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
				'USER': 'root',
				'PASSWORD': 'password',
				'HOST': 'db',
				'PORT': 5432,
    }
}

```

## dev

### Set up

```bash
# build
docker compose build
# up
docker compose up
## remote container ##

# down
docker compose down
```

## Specs

- python 3.9
- django 3.2（LTS）
