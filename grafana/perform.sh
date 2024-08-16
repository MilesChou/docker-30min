#!/usr/bin/env bash

export TZ=Asia/Taipei

echo [$(date +"%Y-%m-%d %H:%M:%S")] "Creating OAuth 2 Client ..."

client=$(docker-compose run --rm hydra hydra \
        --endpoint http://hydra:4445 \
        create oauth2-client \
        --format json \
        --grant-type authorization_code \
        --grant-type client_credentials \
        --scope offline \
        --scope openid \
        --redirect-uri http://127.0.0.1:4446/callback
        )

client_id=$(echo "$client" | jq -r '.client_id')
client_secret=$(echo "$client" | jq -r '.client_secret')

echo

echo [$(date +"%Y-%m-%d %H:%M:%S")] "Performing Client Credentials Flow ..."

token=$(docker-compose exec hydra hydra \
              --endpoint http://127.0.0.1:4444 \
              perform client-credentials \
              --client-id "$client_id" \
              --client-secret "$client_secret" \
              --format json
              )

access_token=$(echo "$token" | jq -r '.access_token')

echo

echo [$(date +"%Y-%m-%d %H:%M:%S")] "Introspecting Token ..."
echo

docker-compose exec hydra hydra \
              --endpoint http://127.0.0.1:4445 \
              introspect token \
              "$access_token"

echo

echo [$(date +"%Y-%m-%d %H:%M:%S")] "Revoking Token ..."
echo

docker-compose exec hydra hydra \
              --endpoint http://127.0.0.1:4444 \
              revoke token \
              --client-id "$client_id" \
              --client-secret "$client_secret" \
              "$access_token"

echo