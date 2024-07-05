#!/bin/bash
set -e #エラーが発生するとスクリプトを終了する意味

# Remove a potentially pre-existing server.pid for Rails.
#server.pid が存在するとサーバーが起動できない事象の対策のため、server.pidを削除するように設定
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
#DockerfileのCMDで渡されたコマンド(Railsサーバー起動)を実行
exec "$@"