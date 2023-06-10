#!/bin/bash
if [ -z "$1" ]; then
  echo "Please provide the password length as an argument."
  exit 1
fi

chset="A-Za-z0-9@#$%"

# Generate the random password
password=$(tr -dc "$chset" < /dev/urandom | head -c "$1")

echo "Random password (using /dev/urandom): $password"
