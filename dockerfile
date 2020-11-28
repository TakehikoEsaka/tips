# jupyter notebookのパスワード設定
# Dockerfile 内に以下の2行を追加
 RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.password = 'sha1:099fb02aae7d:8350f59667778656fffd0859a028ee90a28ef5bc'" >> ~/.jupyter/jupyter_notebook_config.py

# sleep
command: /bin/sh -c "while :; do sleep 10; done"
