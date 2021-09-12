#/bin/bash
set -eu

./node_modules/.bin/esbuild target/lib/worker-gleam-template/index.js --bundle --outfile=target/dist/index.js
