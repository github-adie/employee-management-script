#!/bin/bash

EMPLOYEE_FILE="employees.txt"
DELETED_FILE="deleted.txt"

# Define login credentials
USERNAME="admin"
PASSWORD="admin"

# Function to display the login prompt
login() {
    while true; do
        local user
        local pass
        read -p "Enter Username: " user
        read -sp "Enter Password: " pass
        echo
        if [[ "$user" == "$USERNAME" && "$pass" == "$PASSWORD" ]]; then
            echo "Login successful."
            break
        else
            echo "Invalid credentials. Try again."
        fi
    done
}

display_menu() {
    echo "1. Add Employee"
    echo "2. Delete Employee by ID"
    echo "3. Search Employee by ID"
    echo "4. Search Employee by Name"
    echo "5. Update Employee Details"
    echo "6. Display All Employees"
    echo "7. Display Deleted Employees"
    echo "8. Exit"
}

add_employee() {
    read -p "Enter Employee ID: " id
    if grep -q "^$id," "$EMPLOYEE_FILE"; then
        echo "Employee ID already exists."
        return
    fi
    read -p "Enter Name: " name
    read -p "Enter Department: " department
    read -p "Enter Position: " position
    read -p "Enter Salary: " salary
    echo "$id,$name,$department,$position,$salary" >> "$EMPLOYEE_FILE"
    echo "Employee added successfully."
}

delete_employee() {
    read -p "Enter Employee ID to delete: " id
    if ! grep -q "^$id," "$EMPLOYEE_FILE"; then
        echo "Employee ID not found."
        return
    fi
    # Save the employee details to deleted.txt
    grep "^$id," "$EMPLOYEE_FILE" >> "$DELETED_FILE"
    # Remove the employee from the employee file
    grep -v "^$id," "$EMPLOYEE_FILE" > temp.txt && mv temp.txt "$EMPLOYEE_FILE"
    echo "Employee deleted successfully."
}

search_employee_by_id() {
    read -p "Enter Employee ID to search: " id
    grep "^$id," "$EMPLOYEE_FILE" || echo "Employee ID not found."
}

search_employee_by_name() {
    read -p "Enter Employee Name to search: " name
    grep ",$name," "$EMPLOYEE_FILE" || echo "Employee Name not found."
}

update_employee() {
    read -p "Enter Employee ID to update: " id
    if ! grep -q "^$id," "$EMPLOYEE_FILE"; then
        echo "Employee ID not found."
        return
    fi
    current_details=$(grep "^$id," "$EMPLOYEE_FILE")
    IFS=',' read -r -a details <<< "$current_details"
    read -p "Enter new Name (current: ${details[1]}): " name
    read -p "Enter new Department (current: ${details[2]}): " department
    read -p "Enter new Position (current: ${details[3]}): " position
    read -p "Enter new Salary (current: ${details[4]}): " salary
    name=${name:-${details[1]}}
    department=${department:-${details[2]}}
    position=${position:-${details[3]}}
    salary=${salary:-${details[4]}}
    grep -v "^$id," "$EMPLOYEE_FILE" > temp.txt && mv temp.txt "$EMPLOYEE_FILE"
    echo "$id,$name,$department,$position,$salary" >> "$EMPLOYEE_FILE"
    echo "Employee details updated successfully."
}

display_all_employees() {
    cat "$EMPLOYEE_FILE"
}

display_deleted_employees() {
    cat "$DELETED_FILE"
}

# Call the login function at the beginning
login

while true; do
    display_menu
    read -p "Choose an option: " choice
    case $choice in
        1) add_employee ;;
        2) delete_employee ;;
        3) search_employee_by_id ;;
        4) search_employee_by_name ;;
        5) update_employee ;;
        6) display_all_employees ;;
        7) display_deleted_employees ;;
        8) exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
