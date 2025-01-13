#!/bin/bash

# Variables (update as needed)
TARGET_BRANCH="main"  # Replace with the branch you want to raise the PR against
COMMIT_MESSAGE="Your commit message here"  # Replace with your commit message
PR_TITLE="Your Pull Request Title"  # Replace with your PR title
PR_BODY="Your Pull Request description goes here"  # Replace with your PR description

# Step 1: Get the current branch name
CURRENT_BRANCH=$(git branch --show-current)

if [ -z "$CURRENT_BRANCH" ]; then
  echo "You are not in a Git repository or on a valid branch. Exiting..."
  exit 1
fi

echo "Current branch detected: $CURRENT_BRANCH"

# Step 2: Check for changes
if git diff-index --quiet HEAD --; then
  echo "No changes to commit. Exiting..."
  exit 1
fi

# Step 3: Add and commit changes
echo "Adding and committing changes..."
git add .
git commit -m "$COMMIT_MESSAGE"

# Step 4: Push changes to remote
echo "Pushing changes to remote branch: $CURRENT_BRANCH"
git push -u origin "$CURRENT_BRANCH"

# Step 5: Raise a pull request
echo "Raising a pull request against branch: $TARGET_BRANCH"
gh pr create --base "$TARGET_BRANCH" --head "$CURRENT_BRANCH" --title "$PR_TITLE" --body "$PR_BODY"

# Step 6: Output success message
echo "Pull request created successfully!"
