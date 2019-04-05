#!/bin/bash
set -e

if [ $# -eq 0 ]
  then
    jupyter lab /workdir --ip=0.0.0.0 --NotebookApp.token='local-development' --allow-root --no-browser &> /dev/null &
    /code-server/code-server /workdir --allow-http --no-auth
  else
    exec "$@"
fi