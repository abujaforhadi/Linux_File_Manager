#!/bin/bash

my_menu() {
    echo "Linux File Manager"
    echo "1. List files"
    echo "2. Create a file"
    echo "3. Delete a file"
    echo "4. Rename a file"
    echo "5. Set file permissions"
    echo "6. Open a file"
    echo "7. Move a file"
    echo "8. Exit"
}

list() {
    echo "Files in the current directory:"
    ls -l
}

create() {
    echo "Enter the name of the file:"
    read filename
    touch "$filename"
    echo "File created successfully."
}

delete() {
    echo "Enter the name of the file to delete:"
    read filename
    rm "$filename"
    echo "File deleted successfully."
}

rename() {
    echo "Enter the name of the file to rename:"
    read oldname
    echo "Enter the new name:"
    read newname
    mv "$oldname" "$newname"
    echo "File renamed successfully."
}


permission_set() {
    echo "Enter the name of the file:"
    read filename
    echo "Enter the permission string (+x,+rwx,-rwx etc.):"
    read permission
    chmod "$permission" "$filename"
    echo "File permissions set successfully."
}

file_open() {
    echo "Enter the name of the file to open:"
    read filename
    if [ -f "$filename" ]; then
        echo "Opening file..."
        nano "$filename"
    else
        echo "File does not exist."
    fi
}


move() {
    echo "Enter the name of the file to move:"
    read filename
    echo "Enter the destination directory:"
    read destination
    mv "$filename" "$destination"
    echo "File moved successfully."
}


while true; do
    my_menu
    echo "Enter your choice:"
    read choice

    case $choice in
        1)
            list
            ;;
        2)
            create
            ;;
        3)
            delete
            ;;
        4)
            rename
            ;;
        5)
            permission_set
            ;;
        6)
            file_open
            ;;
        7)
            move
            ;;
        8)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac

    echo
done
