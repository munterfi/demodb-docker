#!/bin/bash
set -e

unzip -p "$DB_FILE" | psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"
