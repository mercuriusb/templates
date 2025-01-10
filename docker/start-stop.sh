#!/bin/bash

# Define the base path for all subdirectories
base_path="/path/to/base" # Replace with the actual base path

# Define the list of subdirectories relative to the base path
subdirs=("dir1" "dir2" "dir3") # Replace with your actual directory names

# Check if a parameter is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [up|down]"
    exit 1
fi

# Get the command (up or down)
command=$1

# Function to process directories
process_directories() {
    local dirs=("$@")
    for dir in "${dirs[@]}"; do
        full_path="$base_path/$dir"
        if [ -d "$full_path" ]; then
            echo "Entering directory: $full_path"
            cd "$full_path" || exit
            if [ "$command" == "up" ]; then
                echo "Running 'docker compose up -d' in $full_path"
                docker compose up -d
            elif [ "$command" == "down" ]; then
                echo "Running 'docker compose down' in $full_path"
                docker compose down
            fi
            cd - > /dev/null || exit
        else
            echo "Directory $full_path does not exist. Skipping."
        fi
        sleep 2
    done
}

# Execute based on the command
if [ "$command" == "up" ]; then
    process_directories "${subdirs[@]}"
elif [ "$command" == "down" ]; then
    # Reverse the order for 'down'
    reversed_subdirs=($(echo "${subdirs[@]}" | tac -s ' '))
    process_directories "${reversed_subdirs[@]}"
else
    echo "Invalid command: $command. Use 'up' or 'down'."
    exit 1
fi
