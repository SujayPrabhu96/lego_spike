#!/bin/bash

# Ensure we're in a Git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "Error: This script must be run inside a Git repository."
  exit 1
fi

# Fetch the list of changed migration files in the engines
changed_engine_migrations=$(git diff --name-only origin/main HEAD -- 'packages/**/db/migrate/*')

# Fetch the list of changed migration files in the main app
changed_main_migrations=$(git diff --name-only origin/main HEAD -- 'db/migrate/*')

# Convert the lists to arrays
IFS=$'\n' read -r -d '' -a engine_migrations <<< "$changed_engine_migrations"
IFS=$'\n' read -r -d '' -a main_migrations <<< "$changed_main_migrations"

# Extract migration filenames
engine_migration_files=()
for path in "${engine_migrations[@]}"; do
  engine_migration_files+=("$(basename "$path")")
done

main_migration_files=()
for path in "${main_migrations[@]}"; do
  main_migration_files+=("$(basename "$path")")
done

# Check if every engine migration has a corresponding main app migration
missing_migrations=()
for file in "${engine_migration_files[@]}"; do
  if [[ ! " ${main_migration_files[@]} " =~ " ${file} " ]]; then
    missing_migrations+=("$file")
  fi
done

# If there are missing migrations, fail the CI
if [ ${#missing_migrations[@]} -ne 0 ]; then
  echo "Error: The following migrations are missing in the main app:"
  for file in "${missing_migrations[@]}"; do
    echo "- $file"
  done
  exit 1
else
  echo "All migrations are present in the main app."
fi
