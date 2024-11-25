echo "enter the file name you wnna create"
read  filename
touch $filename
echo "Start entering lines (writing end will end the operation)"
count=0
while true
do
  read line
  if [ "$line" = "end" ]; then
    break
  fi
  echo "$line" >> $filename
  count=$((count + 1))
done
echo "Total lines entered: $count"

