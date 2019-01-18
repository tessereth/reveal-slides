#!/bin/bash

set -eu

USAGE=$(cat <<-END
Usage: $0 [markdown-file]
END
)

if [[ $# -ne 1 || ! -f $1 ]]; then
    echo $USAGE
    exit 1
fi

SLIDES=$1

if which yarn > /dev/null; then
    JS_MANAGER=yarn
elif which npm > /dev/null; then
    JS_MANAGER=npm
else
    echo "Please install either npm or yarn and ensure it's on the path"
    exit 1
fi

if [[ ! -e reveal.js ]]; then
    git clone git@github.com:hakimel/reveal.js.git
fi

pushd reveal.js > /dev/null

if [[ ! -e node_modules ]]; then
    $JS_MANAGER install
fi

ln -sf ../index.html index.html
ln -sf ../$SLIDES slides.md
ln -sfn ../assets assets

$JS_MANAGER start

# This will never be run but for completeness
popd > /dev/null
