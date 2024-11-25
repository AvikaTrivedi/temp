start=1
end=10
echo "Series of numbers multiplied by 2:"
i=$start
while [ $i -le $end ]
do
echo "$(( i * 2 ))"
i=$(( i + 1 ))
done

