#!/bin/bash

# A script to copy a specific subfolder from a remote Git repository
# into the current local repository using a safe and direct method.

# --- Configuration and Input Validation ---

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if the correct number of arguments are provided.
if [ "$#" -ne 2 ]; then
    echo "❌ Error: Invalid number of arguments."
    echo "Usage: ./git-copy-folder.sh <remote_repo_url> <folder_path_to_copy>"
    echo "Example: ./git-copy-folder.sh https://github.com/googleapis/styleguide.git go"
    exit 1
fi

# Assign arguments to variables for clarity.
REMOTE_REPO_URL=$1
FOLDER_PATH=$2
TEMP_REMOTE_NAME="temp_source_repo_$(date +%s)" # Add timestamp for uniqueness

# --- Cleanup Function ---

# This function contains all cleanup commands. It will be called automatically
# when the script exits, for any reason (success, error, or interruption).
cleanup() {
    echo "🧹 Running cleanup..."
    # The '|| true' part prevents the script from exiting if a cleanup command fails
    # (e.g., trying to remove a remote that doesn't exist).
    git remote remove "$TEMP_REMOTE_NAME" >/dev/null 2>&1 || true
    echo "   - Cleanup complete."
}

# The 'trap' command ensures the 'cleanup' function is executed when the script exits.
trap cleanup EXIT


# --- Main Logic ---

echo "▶️ Starting the folder copy process..."

# 1. Add the source repository as a temporary remote.
echo "   - Adding temporary remote '$TEMP_REMOTE_NAME'..."
git remote add "$TEMP_REMOTE_NAME" "$REMOTE_REPO_URL"

# 2. Fetch the data from the temporary remote.
echo "   - Fetching data from the remote repository (this might take a moment)..."
git fetch "$TEMP_REMOTE_NAME"

# 3. Read the desired folder from the remote branch directly into the staging area.
# This is the key step. 'git read-tree' reads repository data without touching
# the working directory or switching branches.
#   --prefix=<path>/ : Places the files into a subdirectory.
#   -u : After reading the tree, it also updates the working directory with the new files.
#   <remote>/main:<path> : Specifies the exact tree to read (the folder from the remote's main branch).
echo "   - Reading the remote folder into your project..."
git read-tree --prefix="$FOLDER_PATH/" -u "$TEMP_REMOTE_NAME/main":"$FOLDER_PATH"

# 4. Create a commit for the newly added folder.
# The files are already staged in the index by the 'read-tree' command.
echo "   - Creating a commit for the copied folder..."
git commit -m "feat: Copy '$FOLDER_PATH' from external repository

Copied from the repository: $REMOTE_REPO_URL"

# The cleanup function will run automatically now.

echo "✅ Success! The folder '$FOLDER_PATH' has been copied and committed."
echo "Your local repository is clean and can sync with your original remote."

