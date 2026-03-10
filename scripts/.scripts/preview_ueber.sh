#!/usr/bin/env bash

export PATH="$PATH:$HOME/go/bin"

fzf --preview '
    if [[ $(file --mime-type -b {}) == image/* ]]; then
        kitty +kitten icat --clear --transfer-mode=memory --unicode-placeholder \
            --stdin=no --place "${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0" \
            {} 2>/dev/null
    else
        pistol {}
    fi
' \
    --preview-window "right,65%" \
    "$@"
