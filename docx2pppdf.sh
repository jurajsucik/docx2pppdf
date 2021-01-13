#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <docx file> <password>"
    exit 2
fi

echo "converting $1 to PDF"
pdf=$1.pdf
docx2pdf "$1" "$pdf"

pppdf=$(echo $1 | sed 's/.docx/.pdf/')
echo "adding password protection to $pppdf"
pdftk "$pdf" output "$pppdf" userpw $2
