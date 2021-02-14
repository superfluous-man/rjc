#!/bin/sh

# If a command fails then the backup stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# git add
git add .

# Commit changes.
msg="sh script site daily backup $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push -u origin master
