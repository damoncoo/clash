#!/bin/bash

FILENAMES=$(ls)
for FILENAME in $FILENAMES; do
    if [[ ! ($FILENAME =~ ".exe" || $FILENAME =~ ".sh") ]]; then
        gzip -S ".gz" "$FILENAME"
    elif [[ $FILENAME =~ ".exe" ]]; then
        zip -m "${FILENAME%.*}".zip "$FILENAME"
    else
        echo "skip $FILENAME"
    fi
done

FILENAMES=$(ls)
for FILENAME in $FILENAMES; do
    if [[ $FILENAME =~ ".zip" ]]; then
        echo "rename $FILENAME"
        mv "$FILENAME" "${FILENAME%.*}"-"${VERSION}".zip
    elif [[ $FILENAME =~ "tar.gz" ]]; then
        echo "rename $FILENAME"
        mv "$FILENAME" "${FILENAME%.*}"-"${VERSION}".tar.gz
    else
        echo "skip $FILENAME"
    fi
done
