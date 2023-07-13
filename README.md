# Django_Docker_Environment Docker + Django + MySQL 環境(実行前のファイル構成)

#### 更新日時

- 2023-02-19 作成
- 2023-02-25 作成
<h3>更新日時</h3>
<dl>
	<dt> - 2023年02月19日(日)</dt>
	<dd>
		本リポジトリ作成
		Docker + MySQL + phpMyAdminの環境構築用
	</dd>
	<dt> - 2023年02月25日(土)</dt>
	<dd>
		一応動くように環境構築できた．使用方法は下記参照
		another_version_dockerも動く．フォルダ配置とrequirements.txt用意したら使用可能
	</dd>
</dl>

# 使用方法

1. このプロジェクトをクローンする．
2. Docker 環境で実行したい Docker プロジェクトを backend に配置する．または，そのディレクトリに移動して新規作成する．
3. 「docker-compose.yml」があるディレクトリで「docker-compose build」コマンドで Docker コンテナを作成
4. その後初めての場合は Django のプロジェクトがないのでコンテナを起動しながらプロジェクトを作成する「docker-compose run web django-admin.py startproject <作成したいプロジェクト名> .」を行う．それ以外で作成後の起動もしくは backend に Djangp プロジェクトを持っていく場合は「docker-compose up」でコンテナを起動する
5. djangopj/settings.py を開き下の記述する内容のように DB の設定を変更する
6. アクセスできるかを確認する．

## アクセス URL 等

- Django ページ URL：[http://localhost:8555/](http://localhost:8555/)[日付:2023/02/25]
- phpMyAdminURL：[http://127.0.0.1:8777/](http://127.0.0.1:8777/)[日付:2023/02/25]

## settings.py に記述する内容

```
'default': {
		'ENGINE': 'django.db.backends.mysql',
		'NAME': 'Django_Test',
		'USER': 'root',
		'PASSWORD': 'user_pass',
		'HOST': 'db',
		'PORT': 3306,
}
```

## Django プロジェクトの配置場所

backend に配置する

## 100．参考文献・参考資料・参考サイト・引用サイト

- [Docker Django MySQL phpMyAdmin 環境構築](https://note.com/akiroppongi/n/n313073e458ca)[日付:2023/02/25]
- [Django+MySQL の開発環境を docker-compose で構築する](https://qiita.com/bakupen/items/f23ce3d2325b4491a2dd)[日付:2023/02/25]
- [Django,MySQL,phpMyAdmin の環境を Docker で構築](https://note.com/akiroppongi/n/n313073e458ca)[日付:2023/02/25]
- [【django】Docker で簡単に開発環境](https://self-methods.com/django-docker-easy/)[日付:2023/02/25]
- [【Docker】MySQL を簡単に構築](https://zenn.dev/re24_1986/articles/153cdc5db96dc0)[日付:2023/02/25]
- [Docker で Django をつかえるようにする](https://omathin.com/docker-compose-django/) [日付:2023/02/25]
- [phpMyAdmin の設定](https://chigusa-web.com/blog/django-docker-mysql/) [日付:2023/02/25]
- [Docker で MySQL を使えるようにする](https://gihyo.jp/dev/serial/01/mysql-road-construction-news/0167) [日付:2023/02/25]
