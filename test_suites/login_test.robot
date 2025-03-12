*** Settings ***
Resource    ../resources/common_resources.robot
Suite Teardown    Finish test

#robot -d results test_suites/login_test.robot

*** Variables ***
${NAME_FIELD_ID}    //input[@name="name"]
${VALID_NAME}    Eva
${EMAIL_FIELD_ID}    //input[@name="email"][@data-qa="signup-email"]
${VALID_EMAIL}    evatestemail@gmail.com
${HEADER_ACCOUNT_INFO}    //*[@class="login-form"]/h2
${EMAIL_FIELD_LOGIN_ID}    //input[@name="email"][@data-qa="login-email"]
${INVALID_USER_EMAIL}    hola@gmail.com
${INPUT_PASSWORD}    //input[@type="password"]
${INVALID_PASSWORD}    invalidpass1
${CREATE_ACCOUNT_BUTTON}    //button[@type="submit"][@data-qa="create-account"]
${CONTINUE_BUTTON_ID}    //*[@class="btn btn-primary"]
${ERROR_EXISTING_USER_ID}    //*[@id="form"]//p

*** Test Cases ***
Register user
    [Tags]  UI_tests_Part1
    [Documentation]  This test case should verify the ability of registering a new user
    [Setup]  Go To Automation Exercise Home Page
    Verify User Can Navigate To Sign Up Page
    Verify User Can Input User Name And Email    ${VALID_NAME}    ${VALID_EMAIL}
    Verify User Is Successfully Redirected To Enter Account Information Page    ${HEADER_ACCOUNT_INFO}    ENTER ACCOUNT INFORMATION
    Verify User Can Enter Account Information
    Verify User Can Sing Up for Newsletter
    Verify User Can Enter Address Information
    Click Button    ${CREATE_ACCOUNT_BUTTON}
    Verify Account Is Successfully Created
    Click Link    ${CONTINUE_BUTTON_ID}
    Verify A New User Is Successfully Logged In

Login User with correct email and password
    [Tags]  UI_tests_Part1
    [Documentation]  This test case should verify if user with correct credentials can login
    [Setup]  Go To Automation Exercise Home Page
    Verify User Can Navigate To Login Page
    Log In User To Application    ${VALID_EMAIL}    ${PASSWORD_VALUE}
    Verify User Is Successfully Logged In

Login User with incorrect email and password
    [Tags]  UI_tests_Part1
    [Documentation]  This test case should verify if user cannot login with incorrect credentials
    [Setup]  Go To Automation Exercise Home Page
    Verify User Can Navigate To Login Page
    Log In User To Application    ${INVALID_USER_EMAIL}    ${INVALID_PASSWORD}
    Verify User Cannot Login    ${ERROR_INVALID_CREDENTIALS_ID}    Your email or password is incorrect!

Logout User
    [Tags]  UI_tests_Part1
    [Documentation]  This test case should verify if user log out from the application
    [Setup]  Go To Automation Exercise Home Page
    Verify User Can Navigate To Login Page
    Log In User To Application    ${VALID_EMAIL}    ${PASSWORD_VALUE}
    Log Out User From Account

Register User with existing email
    [Tags]  UI_tests_Part1
    [Documentation]  This test case should verify if user cannot create an account with already existing credentials
    [Setup]  Go To Automation Exercise Home Page
    Verify User Can Navigate To Sign Up Page
    Verify User Can Input User Name And Email    ${VALID_NAME}    ${VALID_EMAIL}
    Verify User Cannot Create An Account    ${ERROR_EXISTING_USER_ID}    Email Address already exist!


