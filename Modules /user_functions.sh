#!/bin/bash
#==========================================================
# User Management Functions
#==========================================================

create_new_user() {
    read -p "Enter new username: " username
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists!"
    else
        read -s -p "Enter password for $username: " password
        echo
        useradd -m "$username" && echo "$username:$password" | chpasswd
        if [ $? -eq 0 ]; then
            echo "User '$username' created successfully."
        else
            echo "Failed to create user '$username'."
        fi
    fi
}

delete_user() {
    read -p "Enter username to delete: " username
    if id "$username" &>/dev/null; then
        userdel -r "$username"
        echo "User '$username' deleted."
    else
        echo "User '$username' not found."
    fi
}

modify_user() {
    read -p "Enter username to modify: " username
    if id "$username" &>/dev/null; then
        echo "1) Change shell"
        echo "2) Change home directory"
        read -p "Choose an option: " opt
        case $opt in
            1)
                read -p "Enter new shell path (e.g. /bin/bash): " shell
                chsh -s "$shell" "$username" && echo "Shell changed."
                ;;
            2)
                read -p "Enter new home directory: " newhome
                usermod -d "$newhome" "$username" && echo "Home directory changed."
                ;;
            *) echo "Invalid choice." ;;
        esac
    else
        echo "User '$username' not found."
    fi
}

display_users() {
    echo "List of users:"
    awk -F: '$3>=1000 && $3<60000 {print $1}' /etc/passwd
}

disable_user() {
    read -p "Enter username to disable: " username
    usermod -L "$username" && echo "User disabled."
}

enable_user() {
    read -p "Enter username to enable: " username
    usermod -U "$username" && echo "User enabled."
}

change_password() {
    read -p "Enter username to change password: " username
    passwd "$username"
}


