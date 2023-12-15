

#! bin/bash -X

changed_files=$(git diff --name-only)
echo "$changed_files"
# Check if there are any .xml files in the changed files
if echo "$changed_files" | grep -qE '\.xml$'; then
    echo "Skipping the build because .xml files are present in the changes."
else
    echo "Proceeding with the build."
    exit 1
    # Add your build steps here
fi

