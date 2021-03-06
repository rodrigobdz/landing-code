#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Generate minified CSS
cd themes/coder
make build
cd ../..

# Build the project.
hugo

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come back up to the project root
cd ..

# Add changes to git.
git add public
# Commit changes on submodule
git commit -m "$msg"
# Push changes in public directory
git push origin master
