#!/bin/bash

# Navigate to the _posts directory
cd _posts

# Loop through each markdown file in the _posts directory
for f in *.markdown; do
    # Extract lines that contain 'tags:'
    tags_line=$(grep '^tags:' "$f")
    
    # Check if tags were found
    if [ ! -z "$tags_line" ]; then
        # Remove 'tags:' and split into an array
        tags=$(echo $tags_line | sed 's/tags: //' | tr ',' '\n')
        
        # Loop through each tag
        for tag in $tags; do
            # Trim whitespace
            tag=$(echo $tag | xargs)
            
            # Define the path for the tag file
            tagpath="../tag/${tag}.markdown"
            
            # Check if the tag file does not exist
            if [ ! -f "$tagpath" ]; then
                # Create the tag file and write the front matter
                echo "---" > "$tagpath"
                echo "layout: tagspage" >> "$tagpath"
                # echo "title: \"Tag: $tag\"" >> "$tagpath"
                echo "title: \"\"" >> "$tagpath"
                echo "tag: $tag" >> "$tagpath"
                echo "---" >> "$tagpath"
                echo "The file [$tagpath] has been created."
            fi
        done
    fi
done

# Return to the original directory
cd -
