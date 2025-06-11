# Check if a source file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <source_file.c>"
  exit 1
fi

# Extract the filename without extension
filename=$(basename -- "$1")
name="${filename%.*}"

# Compile the C file
gcc "$1" -o "$name"

# Check if compilation was successful
if [ $? -eq 0 ]; then
  # Run the compiled program
  ./$name

  # Delete the compiled file
  rm -f "$name"
else
  echo "Compilation failed."
  exit 1
fi
