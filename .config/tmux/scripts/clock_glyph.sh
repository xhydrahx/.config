#!/bin/bash

hour=$(date +%I)

case $hour in
    01) glyph="" ;;
    02) glyph="" ;;
    03) glyph="" ;;
    04) glyph="" ;;
    05) glyph="" ;;
    06) glyph="" ;;
    07) glyph="" ;;
    08) glyph="" ;;
    09) glyph="" ;;
    10) glyph="" ;;
    11) glyph="" ;;
    12) glyph="" ;;
    *) glyph="E" ;;
esac

printf "$glyph"
