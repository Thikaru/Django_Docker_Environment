# Django_Docker_Environment

# Docker + Django + MySQL 環境(実行前のファイル構成)

- 2023-02-19 作成
  Docker + Django + MySQL が使える環境を構築

## Django プロジェクトの配置場所

backend に配置する

'default': {
'ENGINE': 'django.db.backends.mysql',
'NAME': 'DjangoTest',
'USER': 'usertest',
'PASSWORD': 'user_pass',
'HOST': 'db',
'PORT': '3306',
}

'default': {
'ENGINE': 'django.db.backends.mysql',
'NAME': '${DB_NAME}',
        'USER': '${DB_USER}',
'PASSWORD': '${DB_PASS}',
'HOST': 'db',
'PORT': '3306',
}

'default': {
'ENGINE': 'django.db.backends.mysql',
'NAME': 'Django_Test',
'USER': 'root',
'PASSWORD': 'user_pass',
'HOST': 'db',
'PORT': '3306',
}

'default': {
'ENGINE': 'django.db.backends.mysql',
'NAME': 'Django_Test',
'USER': 'root',
'PASSWORD': 'user_pass',
'HOST': 'db',
'PORT': '3311',
}
