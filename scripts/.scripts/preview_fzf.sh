#!/usr/bin/env bash

export PATH="$PATH:$HOME/go/bin"

SHELL=bash fzf --preview '
    file={}
    case "${file##*.}" in
        png|jpg|jpeg|gif|bmp|webp|svg|ico|tiff)
            kitty +kitten icat --clear --transfer-mode=memory --unicode-placeholder \
                --stdin=no --place "${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0" \
                "$file" 2>/dev/null
            ;;
        *)
            pistol "$file"
            ;;
    esac
' --preview-window "right,65%" "$@"
