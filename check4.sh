

#! bin/bash


changed_files= git diff --name-only HEAD^ HEAD | grep -Ev '\.xml$' | grep -Ev '\.xml\.j2$'
echo "$changed_files"
xml_files=$(echo "$changed_files" | grep -E '\.xml$')
            if [ -n "$xml_files" ]; then
              echo "XML files changed. Skipping the build."
            else
              echo "No XML files changed. Running the build..."
              # Add your build and test steps here
            fi

