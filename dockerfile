# private registoryへimage問い合わせ
curl -X GET http://192.168.1.233:5001/v2/_catalog

# dockerfileのつくり方
自分が使いたいbase imageを決めてから欲しいpackageで検索するやり方が一番速いと思われる．
挙動がおかしい場合は，imageのバージョン．パッケージのバージョンを変えてみると上手く行くことが多い

# debパッケージからダウンロードまでの一連の流れ
python:slimの場合，apt-getが入らない場合がある．
apt list --installed google* # ローカルに指定したパッケージが存在しないかどうかを確認
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - # 公開鍵を登録してあげる
ls -l /etc/apt/sources.list.d # aptnoのsourceに追加された事を確認する
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb # wgetでファイルを落としてくる
apt install -y ./google-chrome-stable_current_amd64.deb # .debをinstallする時は，２通りの方法がある．
dpkgだと単体で入れる．apt-get install -y (.debファイル)の場合は依存も含めてインストールしてくれる

# jupyter notebookのパスワード設定
# Dockerfile 内に以下の2行を追加
 RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.password = 'sha1:099fb02aae7d:8350f59667778656fffd0859a028ee90a28ef5bc'" >> ~/.jupyter/jupyter_notebook_config.py

# sleep
command: /bin/sh -c "while :; do sleep 10; done"

# copyする時のpath
名前の付け方は良くないが以下のディレクトリ構造があったとする。
この時、Dockerfileは以下のように書くべき
COPY appication/ /application/ # localhost側は相対パスで指定。コンテナ側は絶対パスを指定。cpコマンドの容量と同じでapplicationフォルダがapplicationにrename処理されてcopyする。
WORKDIR /application/application/ # コンテナの絶対パスを指定する。execで入った時はこのパスに最初に落ちて来る

application
| - application
|        |- start.py 
Dockerfile

※ volumeの時も理屈は同じ。ただ、localhsot側はdocker-compose.ymlとDockerfileそれぞれからの相対パスになるので要注意
