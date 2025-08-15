#!/bin/bash

# Check if a source file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <source_file.c|source_file.cpp>"
  exit 1
fi

# Extract the filename without extension
filename=$(basename -- "$1")
name="${filename%.*}"
ext="${filename##*.}"

# Choose compiler based on file extension
case "$ext" in
  c)
    compiler="gcc"
    ;;
  cpp|cc|cxx)
    compiler="g++"
    ;;
  *)
    echo "Unsupported file extension: .$ext"
    exit 1
    ;;
esac

# Compile the file
$compiler "$1" -o "$name"

# Check if compilation was successful
if [ $? -eq 0 ]; then
  # Run the compiled program
  ./"$name"

  # Delete the compiled file
  rm -f "$name"
else
  echo "Compilation failed."
  exit 1
fi
