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
4. その後「docker-compose up」でコンテナを起動する
5. アクセスできるかを確認する．

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
- [GUI おすすめ](https://www.simugrammer.com/python_gui_matome/)[日付:2023/02/25]
- [Python でも簡単に GUI 作成](https://qiita.com/konitech913/items/61dc715ddaad54505a29)[日付:2023/02/25]
- [OpenCV で幾何変換](https://note.nkmk.me/python-opencv-warp-affine-perspective/)[日付:2023/02/25]
- [TEST](https://www)[日付:2023/02/25]
- [文字列](URL) [日付:2023/02/25]
- [文字列](URL) [日付:2023/02/25]
