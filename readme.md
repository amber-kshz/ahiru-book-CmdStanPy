# 概要

このrepositoryは「StanとRでベイズ統計モデリング」([出版社webページ](https://www.kyoritsu-pub.co.jp/bookdetail/9784320112421))のコード([github repository](https://github.com/MatsuuraKentaro/RStanBook))をCmdStanPyで再実装したものです。
dataは上記github repositoryからコピーしたものです。model fileは基本的に本の記載に準拠していますが、一部書き方などが異なります(私が書き間違えている可能性もあります。)。


# Directory構成

* `Makefile` : docker containerのbuildとrunに利用。
* `docker` : docker containerのbuildに必要な`Dockerfile`。
* `chapter{n}` :　各章の内容に対応したstanファイル、データ、ipython notebook。
    * `data` : 入力データ
    * `model` : Stan file


# 実行方法

projectのroot directoryで`make run`するとdocker containerが立ち上がるので、`localhost:8888`にブラウザからアクセスすればJupyterLabが使えます(なお、初回実行時は https://hub.docker.com/r/amberkshz/ahiru-book からimageのdownloadが行われます。)。
