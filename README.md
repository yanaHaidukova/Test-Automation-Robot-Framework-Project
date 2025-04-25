# Test Automation Robot Framework Project

Welcome to the Test Automation Robot Framework Project repository! This project uses Robot Framework for automated testing. This README file will guide you through the process of cloning the repository and installing the necessary packages.

## Requirements

Make sure you have the following installed on your system:

- **Python** (version 3.6+)
- **pip** (Python package installer)
- **Git**

## Cloning the Repository

To clone the repository, follow these steps:

1. Open your terminal or command prompt.
2. Navigate to the directory where you want to clone the repository.
3. Run the following command:

    ```sh
    git clone https://github.com/yanaHaidukova/Test-Automation-Robot-Framework-Project.git
    ```

## Installation
1. Create a virtual environment: ```py -m venv venv```
2. Navigate to your virtual environment directory and activate it executing the following script: ```.\venv\Scripts\activate ```
3. Install the required packages listed in the **requirements.txt** file, run the following command:

    ```sh
    pip install -r requirements.txt
    ```

This will install all the dependencies needed to run the Robot Framework tests.

## Test Execution
1. Open a terminal
2. From the project root directory run: ```robot --pythonpath resources -d results tests/```