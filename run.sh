#!/usr/bin/env bash
set -euo pipefail

# Run from the script's folder so .env and the SQL file are found
cd "$(dirname "$0")"

POSTGRES_PASSWORD=""
while IFS='=' read -r key value || [[ -n "$key" ]]; do
    value="${value%$'\r'}"   # strip Windows line endings if the .env came from Windows
    if [[ "$key" == "POSTGRES_PASSWORD" ]]; then
        POSTGRES_PASSWORD="$value"
    fi
done < .env

psql -d postgres -U postgres -v ON_ERROR_STOP=on -v env_password="$POSTGRES_PASSWORD" -f 0_runAllScripts.sql