#!/bin/bash

source .env
echo Tag commit: $TAG

git tag -a v$TAG -m "Add new version"
git push --tags