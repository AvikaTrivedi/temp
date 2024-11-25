echo "All combinations of 1, 2, and 3:"
for i in 1 2 3
do
for j in 1 2 3
do
for k in 1 2 3
do
if [ $i -ne $j ] && [ $j -ne $k ] && [ $i -ne $k ]; then
echo "$i$j$k"
fi
done
done
done
