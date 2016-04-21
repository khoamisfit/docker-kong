#!/bin/sh
# Setting up ENV for postgres DB
if [[ -n "${POSTGRES_HOST}" ]]; then
  cat /etc/kong/kong.yml \
      | sed -e "s/%POSTGRES_HOST%/${POSTGRES_HOST}/g"
fi

if [[ -n "${POSTGRES_DB}" ]]; then
  cat /etc/kong/kong.yml \
      | sed -e "s/%POSTGRES_DB%/${POSTGRES_DB}/g"
fi

if [[ -n "${POSTGRES_USER}" ]]; then
  cat /etc/kong/kong.yml \
      | sed -e "s/%POSTGRES_USER%/${POSTGRES_USER}/g"
fi

# Setting up the proper database
if [ -n "$DATABASE" ]; then
  echo -e '\ndatabase: "'$DATABASE'"' >> /etc/kong/kong.yml
fi
