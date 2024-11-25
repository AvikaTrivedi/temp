echo "Enter the name of the output file:"
read output
for file in "$@"
do
  if [ -f "$file" ]; then
    cat "$file" >> "$output"
  else
    echo "File $file not found, skipping."
  fi
done
echo "Files concatenated into $output"
