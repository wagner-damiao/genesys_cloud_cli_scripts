#!/bin/bash

# Directory to save the exported files
OUTPUT_DIR="./genesys_scripts_export"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo "Starting the export of all Genesys Cloud screen scripts..."

# Retrieve the list of scripts with a pagesize of 100 and save it to a JSON file
gc scripts list --pageSize 100 > "$OUTPUT_DIR/scripts_raw_output.json"

echo "Returned JSON saved to $OUTPUT_DIR/scripts_raw_output.json for analysis."

# Extract script IDs from the JSON and remove quotes from the IDs
cat "$OUTPUT_DIR/scripts_raw_output.json" | jq -r '.entities[] | .id' > "$OUTPUT_DIR/script_ids.txt"

echo "Extracted script IDs saved to $OUTPUT_DIR/script_ids.txt."

# Check if the script_ids.txt file exists
if [ ! -f "$OUTPUT_DIR/script_ids.txt" ]; then
  echo "File script_ids.txt not found in directory $OUTPUT_DIR."
  echo "Please ensure that the ID extraction was executed correctly."
  exit 1
fi

# Loop to export each script using the IDs from the script_ids.txt file
while read -r scriptId; do
  echo "Exporting script with ID: $scriptId"
  gc scripts get "$scriptId" > "$OUTPUT_DIR/script_$scriptId.json"
done < "$OUTPUT_DIR/script_ids.txt"

echo "Export completed! All scripts have been saved in the directory: $OUTPUT_DIR"
