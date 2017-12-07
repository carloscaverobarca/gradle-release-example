#!/bin/sh

# Commit the CHANGELOG modifications and new versioning
git commit -am 'Automatic release increment and changelog generation'

# Remote to origin
git remote add origin https://${GITHUB_API_TOKEN}@github.com/carloscaverobarca/gradle-release-example.git > /dev/null 2>&1

# Push the modifications into develop
git push origin HEAD:master

# Push tags
git push --tags

echo -e "Done\n"