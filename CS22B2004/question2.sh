#!/bin/bash
modified_dir="modified"
if [ ! -d "$modified_dir" ]; then
  echo "Directory '$modified_dir' does not exist."
  exit 1
fi

# Get the current date and time
c_date=$(date +"%Y-%m-%d")
c_time=$(date +"%H:%M:%S")

for file in "$modified_dir"/*;
do
  if [ -f "$file" ]; then
    echo -e "\nCurrent Date: $c_date" >> "$file"
    echo "Current Time: $c_time" >> "$file"
    echo "Date and time appended to '$file'."
  fi
done
