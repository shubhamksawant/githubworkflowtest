#! /bin/bash

#changed_filesq=$(git diff --name-only )
$changed_filesq =$( git diff --name-only HEAD^ HEAD | grep -Ev '\.xml$' )
echo "$changed_filesq"

#changed_files=$(git diff --name-only ${{ github.event.before }} ${{ github.sha }})
echo "$changed_files"
#if echo "$changed_files" | grep -qE '^src/|tests/'; then
#            echo "Application code changed. Running the workflow..."

            # Check if any XML files are among the changed files
     xml_files=$(echo "$changed_files" | grep -E '\.xml$')
            if [ -n "$xml_files" ]; then
              echo "XML files changed. Skipping the build."
            else
              echo "No XML files changed. Running the build..."
              # Add your build and test steps here
            fi
#else
#            echo "No changes in application code. Skipping the workflow."
#fi
