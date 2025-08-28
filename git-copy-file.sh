#!/bin/bash

# A script to copy a specific file from a remote Git repository
# into the current local repository.

# --- Configuration and Input Validation ---

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if the correct number of arguments are provided.
if [ "$#" -ne 3 ]; then
    echo "❌ Error: Invalid number of arguments."
    echo "Usage: ./git-copy-file.sh <remote_repo_url> <path_to_file_in_repo> <local_destination_path>"
    echo "Example: ./git-copy-file.sh https://github.com/olidec/utilities README.md utils/README.md"
    exit 1
fi

# Assign arguments to variables for clarity.
REMOTE_REPO_URL=$1
REMOTE_FILE_PATH=$2
LOCAL_DEST_PATH=$3
TEMP_REMOTE_NAME="temp_source_repo_$(date +%s)" # Add timestamp for uniqueness

# --- Cleanup Function ---

# This function contains all cleanup commands. It will be called automatically
# when the script exits, for any reason (success, error, or interruption).
cleanup() {
    echo "🧹 Running cleanup..."
    # The '|| true' part prevents the script from exiting if a cleanup command fails.
    git remote remove "$TEMP_REMOTE_NAME" >/dev/null 2>&1 || true
    echo "   - Cleanup complete."
}

# The 'trap' command ensures the 'cleanup' function is executed when the script exits.
trap cleanup EXIT


# --- Main Logic ---

echo "▶️ Starting the file copy process..."

# 1. Add the source repository as a temporary remote.
echo "   - Adding temporary remote '$TEMP_REMOTE_NAME'..."
git remote add "$TEMP_REMOTE_NAME" "$REMOTE_REPO_URL"

# 2. Fetch the data from the temporary remote.
echo "   - Fetching data from the remote repository (this might take a moment)..."
git fetch "$TEMP_REMOTE_NAME"

# 3. Ensure the local destination directory exists.
# The 'dirname' command gets the directory part of the destination path.
# 'mkdir -p' creates the directory and any parent directories if they don't exist.
echo "   - Ensuring destination directory exists..."
mkdir -p "$(dirname "$LOCAL_DEST_PATH")"

# 4. Use 'git show' to extract the file's content and redirect it to the local path.
# This is the key step. 'git show' prints the content of a repository object.
# <remote>/main:<path> specifies the exact file from the remote's main branch.
echo "   - Copying remote file to '$LOCAL_DEST_PATH'..."
git show "$TEMP_REMOTE_NAME/main":"$REMOTE_FILE_PATH" > "$LOCAL_DEST_PATH"

# 5. Stage and commit the newly created file.
echo "   - Staging and committing the new file..."
git add "$LOCAL_DEST_PATH"
git commit -m "feat: Copy '$REMOTE_FILE_PATH' from external repository

Copied from the repository: $REMOTE_REPO_URL"

# The cleanup function will run automatically now.

echo "✅ Success! The file has been copied to '$LOCAL_DEST_PATH' and committed."
echo "Your local repository is clean and can sync with your original remote."

