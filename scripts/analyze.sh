#!/bin/sh

set -e

TYPES_FILE=globalTypes.d.luau

if [ ! -f "$TYPES_FILE" ]; then
    curl https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/main/scripts/globalTypes.d.luau > $TYPES_FILE
fi

luau-lsp analyze --base-luaurc=.luaurc --settings=.luau-analyze.json \
    --ignore '**/node_modules/**' --ignore 'node_modules/**' \
    --definitions=$TYPES_FILE \
    src
