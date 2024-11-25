while true
do
  echo "Choose an option: 1) Check Email 2) Check URL 3) Exit"
  read choice

  case $choice in
    1)
      echo "Enter email:"
      read email
      if echo "$email" | grep -Eq "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"; then
        echo "Valid Email"
      else
        echo "Invalid Email"
      fi
      ;;
    2)
      echo "Enter URL:"
      read url
      if echo "$url" | grep -Eq "^(http|https|ftp)://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(/.*)?$"; then
        echo "Valid URL"
      else
        echo "Invalid URL"
      fi
      ;;
    3)
      exit 0
      ;;
    *)
      echo "Invalid option. Please choose 1, 2, or 3."
      ;;
  esac
done

