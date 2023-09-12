#!/bin/sh

set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /usr/src/app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"


# Wait until Postgres is ready before running the next step.

while ! pg_isready -q -h $DB_HOST -p $DB_PORT -U $POSTGRES_USER

do

    echo "$(date) - waiting for database to start."
    sleep 2

done


# # If the database exists, migrate. Otherwise setup (create and migrate)

echo "Running database migrations..."

bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:setup db:migrate

echo "Finished running database migrations."

echo "Running packages update..."
bundle exec rails packages:update
echo "Finished packages update."

# Generate Admin account
bundle exec rake admin_generator

bundle exec rails s -b 0.0.0.0 -p 3000

