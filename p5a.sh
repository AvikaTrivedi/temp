echo "Enter file name:"
read file
echo "Choose: 1) Head 2) Tail"
read choice
echo "Enter number of lines:"
read lines

if [ "$choice" -eq 1 ]; then
  count=0
  while read line && [ "$count" -lt "$lines" ]; do
    echo "$line"
    count=$((count + 1))
  done < "$file"
elif [ "$choice" -eq 2 ]; then
  total=0
  while read line; do
    total=$((total + 1))
  done < "$file"
  skip=$((total - lines))
  count=0
  while read line; do
    if [ "$count" -ge "$skip" ]; then
      echo "$line"
    fi
    count=$((count + 1))
  done < "$file"
else
  echo "Invalid choice"
fi
