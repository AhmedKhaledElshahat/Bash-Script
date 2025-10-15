#!/bin/bash
#==========================================================
# Group Management Functions
#==========================================================

create_group() {
    read -p "Enter new group name: " groupname
    groupadd "$groupname" && echo "Group '$groupname' created."
}

modify_group() {
    read -p "Enter current group name: " oldgroup
    if getent group "$oldgroup" > /dev/null; then
        echo "1) Rename group"
        echo "2) Change GID"
        read -p "Choose: " choice
        case $choice in
            1)
                read -p "Enter new name: " newgroup
                groupmod -n "$newgroup" "$oldgroup" && echo "Renamed successfully."
                ;;
            2)
                read -p "Enter new GID: " gid
                groupmod -g "$gid" "$oldgroup" && echo "GID updated."
                ;;
            *) echo "Invalid choice." ;;
        esac
    else
        echo "Group not found."
    fi
}

delete_group() {
    read -p "Enter group to delete: " groupname
    groupdel "$groupname" && echo "Group '$groupname' deleted."
}

list_groups() {
    echo "List of groups:"
    getent group | awk -F: '{print $1}'
}
