#!/bin/bash
if [ -z "$1" ]; then
  echo "Please provide the file name as an argument."
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "File '$1' does not exist."
  exit 1
fi

readarray -t lines < "$1"

rows=${#lines[@]}
cols=$(echo "${lines[0]}" | wc -w)

declare -A transposed_matrix

# Transpose the matrix
for ((i = 0; i < rows; i++)); 
do
  line="${lines[i]}"
  read -ra values <<< "$line"

  for ((j = 0; j < cols; j++)); 
  do
    transposed_matrix[$j,$i]=${values[j]}
  done
done

for ((i = 0; i < cols; i++)); do
  for ((j = 0; j < rows; j++)); do
    echo -n "${transposed_matrix[$i,$j]} "
  done
  echo
done
