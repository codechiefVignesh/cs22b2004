#!/bin/bash
if [ -z "$1" ]; then
  echo "Please provide the password length as an argument"
  exit 1
fi

password=$(openssl rand -base64 "$1" | tr -dc 'a-zA-Z0-9@#$%')

echo "Random password (using OpenSSL): $password"
