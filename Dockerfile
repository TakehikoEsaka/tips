## entrypointで.shを書く時の文頭おまじない
#!/bin/sh
pip install selenium

## Dockerでentprypointを遣う時はcopyしてから遣う．docker-composeにentrypointがあると上書きされて使われる
FROM python:3
COPY install_selenium.sh /tmp
ENTRYPOINT ["sh", "/tmp/install_selenium.sh"]
