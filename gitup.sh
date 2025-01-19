#!/bin/bash

# Prompt the user for a commit message
echo "Enter your commit message:"
read commit_message

# Check if a commit message was provided
if [ -z "$commit_message" ]; then
    echo "Error: Commit message cannot be empty."
    exit 1
fi

# Add all changes
git add .

# Commit with the provided message
git commit -m "$commit_message"

# Push to the current branch
git push

