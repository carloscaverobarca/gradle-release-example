#!/bin/sh

# Configure the user
git config --global user.email "carlos.cavero@atos.net"
git config --global user.name "Carlos Cavero"

# Commit the CHANGELOG modifications and new versioning
git commit -am 'Automatic release increment and changelog generation'

# Remote to origin
git remote add origin https://carloscaverobarca:${GITHUB_API_TOKEN}@github.com/carloscaverobarca/gradle-release-example.git > /dev/null 2>&1

# Push the modifications into develop
git push origin HEAD:master

# Push tags
git push --tags

echo -e "Done\n"