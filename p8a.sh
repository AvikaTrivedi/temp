table_file="table.txt"

# Create table with header
echo -e "id\tname\tage\tcity" > "$table_file"
echo "Table initialized with columns: id, name, age, city."

# Main loop for operations
while true; do
    echo
    echo "Choose an operation:"
    echo "1. Create (Add a new row)"
    echo "2. Read (View table)"
    echo "3. Update (Modify a row)"
    echo "4. Delete (Remove a row)"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    if [ $choice -eq 1 ]; then
        # Create
        read -p "Enter id: " id
        read -p "Enter name: " name
        read -p "Enter age: " age
        read -p "Enter city: " city
        echo -e "${id}\t${name}\t${age}\t${city}" >> "$table_file"
        echo "Row added."

    elif [ $choice -eq 2 ]; then
        # Read
        echo "Displaying table:"
        cat "$table_file"

    elif [ $choice -eq 3 ]; then
        # Update
        read -p "Enter id of the row to update: " id
        read -p "Enter column to update (name, age, city): " column
        read -p "Enter new value: " new_value

        # Find the column index
        header=$(head -n 1 "$table_file")
        column_index=0
        for col in $(echo "$header" | tr '\t' ' '); do
            column_index=$((column_index + 1))
            if [ $col == "$column" ]; then
                break
            fi
        done

        # Update the row
        while IFS=$'\t' read -r row_id name age city; do
            if [ $row_id == "$id" ]; then
                # Build updated row
                case $column_index in
                    2) name=$new_value ;;
                    3) age=$new_value ;;
                    4) city=$new_value ;;
                esac
                updated_row=$(echo -e "${row_id}\t${name}\t${age}\t${city}")
                break
            fi
        done < "$table_file"

        # Replace the row
        grep -v "^${id}\t" "$table_file" > temp_table.txt
        echo -e "$updated_row" >> temp_table.txt
        mv temp_table.txt "$table_file"
        echo "Row updated."

    elif [ $choice -eq 4 ]; then
        # Delete
        read -p "Enter id of the row to delete: " id
        grep -v "^${id}\t" "$table_file" > temp_table.txt
        mv temp_table.txt "$table_file"
        echo "Row deleted."

    elif [ $choice -eq 5 ]; then
        # Exit
        echo "Exiting..."
        break

    else
        echo "Invalid choice. Please try again."
    fi
done
