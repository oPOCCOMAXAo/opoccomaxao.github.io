#!/bin/bash
# Overwrite master branch with a new history (no previous commits)

set -e

# Ensure you are in the repo root
cd "$(git rev-parse --show-toplevel)"

# Create a new orphan branch
git checkout --orphan new-master

# Add all files
git add -A

# Commit
git commit -m "Initial commit (reset history)"

# Delete old master branch locally
git branch -D master

# Rename new branch to master
git branch -m master

# Force push to remote master
git push -f origin master

echo "Master branch has been reset with a new history."
