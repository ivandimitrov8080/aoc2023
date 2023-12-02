#!/usr/bin/env bash

removeLetters() {
  echo $1 | sed 's/[^0-9]*//g'
}

sum=0

while read p; do
  nums="$(removeLetters $p)"
  size=${#nums}
  if [ $size = 1 ]; then
    n="$nums$nums"
    sum=$((n + sum))
    continue
  fi
  if (($size > 2)); then
    n="${nums:0:1}${nums:size-1:size}"
    sum=$((n + sum))
    continue
  fi
  sum=$((nums + sum))
done < ./actual-input.txt

echo $sum
