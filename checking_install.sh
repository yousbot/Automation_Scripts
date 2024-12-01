#!/bin/bash

# File to modify
FILE="ibm_db2_create_instance.sh"

# Loop through all days of December
for day in {01..31}; do
  # Check if the file exists
  if [[ -f "$FILE" ]]; then
    # Add or remove a dummy comment
    if grep -q "# Dummy comment" "$FILE"; then
      # Remove the comment
      sed -i '' '/# Dummy comment/d' "$FILE"
    else
      # Add the comment
      echo "# Dummy comment" >> "$FILE"
    fi
    
    # Stage the file
    git add "$FILE"
    
    # Set the commit date and author date
    COMMIT_DATE="2024-$dayT12-12:00:00"
    export GIT_AUTHOR_DATE="$COMMIT_DATE"
    
    # Commit with the specific date
    git commit --date="$COMMIT_DATE" -m "Update on December $day"
    
    # Push the commit
    git push origin master
  else
    echo "File $FILE does not exist. Exiting..."
    exit 1
  fi
done

echo "All days of December processed."
