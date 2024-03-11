#!/bin/bash

# Define the base directory where repositories will be cloned
BASE_PATH="$HOME/git"

# Repository URL provided as the first argument to the script
REPO_URL="$1"

if [[ -z "$REPO_URL" ]]; then
	echo "Usage: $0 <git-repo-url>"
	exit 1
fi

# Remove the protocol part of the URL (http:// or https://)
CLEANED_URL="${REPO_URL#http://}"
CLEANED_URL="${CLEANED_URL#https://}"

# Construct the full target directory path
TARGET_DIR="${BASE_PATH}/${CLEANED_URL}"

# Create the target directory structure
mkdir -p "$TARGET_DIR"

# Change to the target directory
cd "$TARGET_DIR"

# Clone the repository
# Use 'git clone' with the destination directory as '.' to clone into the current directory
git clone "$REPO_URL" .

echo "Repository cloned into: $TARGET_DIR"
