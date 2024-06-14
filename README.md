# Employee Management System

This is a menu-driven Bash script to manage employee details using `grep`. The system can add new employees, delete employees by ID, search employees by ID or name, update employee details, and display all employees. Employee details are stored in a file named `employees.txt`. Deleted employee details are stored in `deleted.txt`.

## Features

- **Login System**: Secure the script with a simple login system.
- **Add Employee**: Add a new employee to the system.
- **Delete Employee**: Delete an employee by their ID and store the details in `deleted.txt`.
- **Search Employee**: Search for an employee by ID or name.
- **Update Employee**: Update an employee's details.
- **Display Employees**: Display all employee records.
- **Display Deleted Employees**: Display all deleted employee records.

## Employee Details

- **ID** (unique)
- **Name**
- **Department**
- **Position**
- **Salary**

## Usage

### Prerequisites

- Bash shell
- `grep` command-line utility

### Script Setup

1. Clone this repository or download the script file.
2. Make the script executable:
    ```sh
    chmod +x employee.sh
    ```

### Running the Script

1. Execute the script:
    ```sh
    ./employee.sh
    ```
2. Login with the following credentials:
    - Username: `admin`
    - Password: `admin`

### Menu Options

1. **Add Employee**
    - Enter the details for the new employee.
2. **Delete Employee by ID**
    - Enter the ID of the employee to delete.
    - The employee details will be stored in `deleted.txt`.
3. **Search Employee by ID**
    - Enter the ID of the employee to search.
    - The script will display the details of the employee if found.
4. **Search Employee by Name**
    - Enter the name of the employee to search.
    - The script will display the details of the employees with the specified name.
5. **Update Employee Details**
    - Enter the ID of the employee to update.
    - Enter the new details for the employee. You can skip fields you don't want to update by pressing Enter.
6. **Display All Employees**
    - The script will display all employee records from `employees.txt`.
7. **Display Deleted Employees**
    - The script will display all deleted employee records from `deleted.txt`.
8. **Exit**
    - Exit the script.

