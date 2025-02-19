## Step 1: Create a New Virtual Environment
1. Open the Settings/Preferences dialog:
    On Windows/Linux: **File > Settings**
    On macOS: **PyCharm > Preferences**
2. Navigate to the Project Interpreter:

3. Expand the Project: <Your Project Name> section on the left sidebar.
4. Click on Python Interpreter.
5. Add a New Interpreter:
    - Click the gear icon next to the current interpreter dropdown.
    - Select Add... from the dropdown menu.
    - Configure the New Virtual Environment:

6. In the Add Python Interpreter dialog, select Virtualenv Environment.
7. Ensure New environment is selected.
8. Specify the location for the new virtual environment. By default, PyCharm will create a venv directory within your project directory.
9. Choose the base interpreter (e.g., Python 3.x) from the dropdown list.
10. Create the Virtual Environment:
    - Click the OK button to create the virtual environment.
    - PyCharm will set up the new virtual environment and configure it as the project interpreter.
## Step 2: Verify the Virtual Environment
Verify the Interpreter:
1. Ensure that the new virtual environment is selected as the project interpreter. You should see the path to the new virtual environment in the interpreter dropdown.
2. Verify the Installed Packages:
    - Click on the Show All link next to the interpreter dropdown to open the Interpreter Settings dialog.
    - You should see the packages installed in the new virtual environment. By default, it will have only the essential packages like pip and setuptools.
## Step 3: Install Required Packages
1. Open the Terminal within PyCharm:
Go to **View** > **Tool Windows** > **Terminal to open the terminal**.
2. Activate the Virtual Environment:
**On Windows**:
    venv\Scripts\activate
**On macOS/Linux**:
    source venv/bin/activate
3. Install Required Packages:
    
   ``` 
    pip install robotframework
    pip install robotframework-seleniumlibrary
    pip install selenium 