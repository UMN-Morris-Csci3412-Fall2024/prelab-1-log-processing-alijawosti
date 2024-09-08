#!/bin/bash

# Check if exactly 3 arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <contents_file> <specifier> <output_file>"
    exit 1
fi

# Assign input arguments to variables
contents_file=$1
specifier=$2
output_file=$3

# Construct the header and footer file names
header_file="${specifier}_header.html"
footer_file="${specifier}_footer.html"

# Check if the files exist
if [[ ! -f "$contents_file" || ! -f "$header_file" || ! -f "$footer_file" ]]; then
    echo "One or more of the input files do not exist."
    exit 1
fi

# Combine the header, contents, and footer into the output file
cat "$header_file" "$contents_file" "$footer_file" > "$output_file"
