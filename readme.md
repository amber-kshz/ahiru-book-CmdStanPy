# 概要

このrepositoryは「StanとRでベイズ統計モデリング」([出版社webページ](https://www.kyoritsu-pub.co.jp/bookdetail/9784320112421))のコードをCmdStanPyで再実装したものです。


# Directory構成

* `Makefile` : docker containerのbuildとrunに利用。
* `docker` : docker containerのbuildに必要な`Dockerfile`。
* `HelloWorld` : CmdStanPyの動作確認用の[Hello, World](https://cmdstanpy.readthedocs.io/en/latest/getting_started.html#hello-world)の内容
* `chap{n}` :　各章の内容に対応したコード、データ、ノートブック。
    * `data` : 入力データ
    * `model` : Stan file


# 実行方法

* projectのroot directoryで`make build`してdocker imageをbuildします(buildをする場合、`TAG`は適宜修正してください。)。
* 同様に`make run`するとdocker containerが立ち上がるので、`localhost:8888`にブラウザからアクセスすればJupyterLabが使えます。
