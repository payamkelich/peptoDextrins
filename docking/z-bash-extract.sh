#!/bin/bash

# Output CSV file
output_file="affinity_result.csv"
temp_file="temp_output.csv"

# Write the header to the temp CSV file
echo "receptor,seed_no,affinity" > "$temp_file"

# Find all files matching the pattern 'out-*.log' in the current directory and all subdirectories
find . -name 'out-*.log' | while read file; do
    # Extract receptor and seed_no from the file name
    receptor=$(basename "$file" | awk -F'[-.]' '{print $2}')
    seed_no=$(basename "$file" | awk -F'[-.]' '{print $3}')

    # Extract the affinity value from the file
    affinity=$(grep -m 1 -E '^[[:space:]]*[0-9]+' "$file" | awk '{print $2}')

    # Write the extracted values to the temp CSV file
    echo "$receptor,$seed_no,$affinity" >> "$temp_file"
done

# Sort the temp CSV file by the seed_no column (numeric sort) and write to the final output file
# Skip the header during sort, then add it back in the final output
tail -n +2 "$temp_file" | sort -t, -k2,2n | awk 'BEGIN{FS=OFS=","} {print $1, $2, $3}' > "$output_file"
sed -i '1ireceptor,seed_no,affinity' "$output_file"

# Remove the temporary file
rm "$temp_file"

# Print a completion message
echo "Sorted CSV file created: $output_file"

