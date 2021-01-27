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
