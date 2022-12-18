#!/bin/bash
# Script entrypoint.sh runs your app.

set -o allexport
source env.sh
set +o allexport

gunicorn app:app --bind $HOST:$PORT
