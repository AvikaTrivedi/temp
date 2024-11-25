while true
do
  echo "Choose an option: 1) Create Directory 2) Remove Directory 3) List Directories 4) Exit"
  read choice

  case $choice in
    1)
      echo "Enter directory name to create:"
      read dirname
      if [ -d "$dirname"]; then 
	echo "diractory already exiist"
      else
      mkdir "$dirname" && echo "Directory $dirname created." || echo  "failed!"
      fi
      ;;
    2)
      echo "Enter directory name to remove:"
      read dirname
       if [ -d "$dirname" ]; then
		if rmdir "$dirname" 2>/dev/null; then
			echo "removed"
		else
		  	echo "not empty cant remove"
               fi 
	else
	echo "Directory dont exist"
        fi
      ;;
    3)
      read -p "enter dir name" dirn
      if [ -d "dirn" ]; then
	rm -rf "dirn" && echo "removed" || echo "failed to remove"
     else 
	echo "dir doesnt exist"
     fi
   ;;

    4)
      read -p "source:" src
      read -p "dest:" dest
	if [ -d "src"]; then
		cp -r "src" "dest" && echo "done" || echo "failed!"
        else
            echo "src dont exist"
        fi
   ;;

    5)

      exit 0
      ;;
    *)
      echo "Invalid option. Please choose 1, 2, 3, or 4."
      ;;
  esac
done
