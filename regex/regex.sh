#!/bin/bash

# Regex 0: Extract names and breakfast items from r0_input.txt
awk '/\* [A-Za-z]+, [A-Za-z]+/ {
  sub(/\* /, "", $0)         # Remove the leading "* "
  split($0, arr, ", ")       # Split the string at the comma and space
  print "1. " arr[1] "\n2. " arr[2] "\n"
}' r0_input.txt > r0_output.txt

# Regex 1: Extract names and favorite sandwiches from r1_input.txt
awk '/\* I am [A-Za-z]+\. My favorite sandwich is [A-Za-z]+./ {
  sub(/\* I am /, "", $0)                 # Remove the leading "* I am"
  sub(/\. My favorite sandwich is /, ",", $0)  # Replace "My favorite sandwich is" with ","
  split($0, arr, ",")                     # Split at the comma
  gsub(/\./, "", arr[2])                  # Remove the trailing period from sandwich name
  print "1. " arr[1] "\n2. " arr[2] "\n"
}' r1_input.txt > r1_output.txt

# Regex 2: Extract sandwich ingredients and whether it's for here or to go from r2_input.txt
awk '/\* sandwich with [A-Za-z0-9.]+\. (for here|to go)/ {
  sub(/\* sandwich with /, "", $0)              # Remove the leading "* sandwich with"
  
  # Split the line at the ". " to separate the sandwich and the order type
  split($0, arr, "\\. ")
  
  sandwich = arr[1] "."                         # Add the period back to the sandwich ingredients
  order_type = arr[2]                           # The order type is in the second part
  
  print "1. " sandwich "\n2. " order_type "\n"  # Print sandwich and order type
}' r2_input.txt > r2_output.txt
