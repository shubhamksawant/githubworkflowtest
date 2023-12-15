


#! /bin/bash

git diff --name-only HEAD^ HEAD | grep -Ev '\.xml$' | grep -Ev '\.xml\.j2$'

if [[ $? -eq 0 ]]; then
        echo "Changes include application code, triggering deploy"
else
        echo "XML file changes detected, skipping build and deploy"
        exit 1
fi
