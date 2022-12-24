#!/bin/bash

# ENTER YOUR GPT API HERE
API_KEY="YOUR_API_KEY"

printf "\nASK: "
read QUERY

printf "GPT: $(curl -s https://api.openai.com/v1/completions \
  -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer '$API_KEY \
  -d '{
  "model": "text-davinci-003",
  "prompt": "'"$QUERY"'",
  "max_tokens": 150,
  "temperature": 0
}' | jq '.choices[].text' | cut -d'"' -f2)\n\n\n"
