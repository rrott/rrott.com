#!/bin/bash
for filename in $1/*.png; do
    mogrify -format jpeg -background white -flatten $filename
done

for filename in $1/*.jpeg; do
    convert $filename -resize 99x "$1/$(basename "$filename" .jpeg)-thumb.jpg"
    convert $filename -resize 336x "$1/$(basename "$filename" .jpeg)-336.jpg"
    convert $filename -resize 768x "$1/$(basename "$filename" .jpeg)-768.jpg"
    convert $filename -resize 1024x "$1/$(basename "$filename" .jpeg)-1024.jpg"
    convert $filename -resize 2048x "$1/$(basename "$filename" .jpeg)-2048.jpg"
done
