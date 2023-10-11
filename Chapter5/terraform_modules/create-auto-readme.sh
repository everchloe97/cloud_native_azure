#!/bin/bash

# Define the README.md file
README="README.md"

# Loop through folders starting with Azure_
for dir in Azure_*; do
  if [ -d "$dir" ]; then
    echo "Processing files in $dir..."

    # Create a section header for the folder in README.md
    echo "## $dir" >> $README

    # Loop through .tf files in the folder
    for file in $dir/*.tf; do
      if [ -f "$file" ]; then
        echo "### $file" >> $README
        # Use Python script to extract and append resource blocks
        python extract_resources.py "$file" >> $README
      fi
    done
  fi
done
