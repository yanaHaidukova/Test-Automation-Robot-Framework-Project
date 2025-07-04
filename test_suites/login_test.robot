*** Settings ***
Resource    ../resources/common_resources.robot
Resource    ../resources/login.robot
Test Setup    Go To Automation Exercise Home Page
Suite Teardown    Login And Delete Account    ${VALID_EMAIL}    ${PASSWORD_VALUE}    ${VALID_NAME}

*** Variables ***
${INVALID_USER_EMAIL}    hola@gmail.com
${INVALID_PASSWORD}    invalidpass1
${CONTINUE_BUTTON_ID}    //*[@class="btn btn-primary"]
${VALIDATION_EXISTING_USER}    //*[@id="form"]//p
${HEADER_LOCATOR_LOGIN}    //*[@class="login-form"]//h2

*** Test Cases ***
Verify New User Registration
    [Tags]  UI_tests_Part1
    Go To Required Link    ${SIGNUP_LOGIN_LINK}    ${HEADER_LOCATOR_LOGIN}    Login to your account
    Register User With New Name And Email    ${VALID_NAME}    ${VALID_EMAIL}    ${HEADER_ACCOUNT_INFO}    ENTER ACCOUNT INFORMATION

Verify User Can Login With Correct Email And Password
    [Tags]  UI_tests_Part1
    Go To Required Link    ${SIGNUP_LOGIN_LINK}    ${HEADER_LOCATOR_LOGIN}    Login to your account
    Check Usen Can Log In With Valid Credentials    ${VALID_EMAIL}    ${PASSWORD_VALUE}    ${VALID_NAME}    ${LOGGEDIN_SUCCESS}

Verify User Cannot Login With Incorrect Email And Password
    [Tags]  UI_tests_Part1
    Go To Required Link    ${SIGNUP_LOGIN_LINK}    ${HEADER_LOCATOR_LOGIN}    Login to your account
    Input And Verify Text Field    ${EMAIL_FIELD_LOGIN_ID}    ${INVALID_USER_EMAIL}
    Input And Verify Text Field    ${INPUT_PASSWORD}    ${INVALID_PASSWORD}
    Click Button  ${LOGIN_BUTTON_ID}
    Check Relevant Text Is Displayed    ${VALIDATION_INVALID_CRED}    Your email or password is incorrect!

Verify User Log Out Flow
    [Tags]  UI_tests_Part1
    Go To Required Link    ${SIGNUP_LOGIN_LINK}    ${HEADER_LOCATOR_LOGIN}    Login to your account
    Check Usen Can Log In With Valid Credentials    ${VALID_EMAIL}    ${PASSWORD_VALUE}   ${VALID_NAME}    ${LOGGEDIN_SUCCESS}
    Go To Required Link    ${LOGGOUT_BUTTON_ID}    ${HEADER_LOCATOR_LOGIN}    Login to your account

Verify User Registration With Existing Email
    [Tags]  UI_tests_Part1
    Go To Required Link    ${SIGNUP_LOGIN_LINK}    ${HEADER_LOCATOR_LOGIN}    Login to your account
    Input And Verify Text Field    ${NAME_FIELD_ID}    ${VALID_NAME}
    Input And Verify Text Field    ${EMAIL_FIELD_ID}    ${VALID_EMAIL}
    Click Button    ${SIGNUP_BUTTON}
    Check Relevant Text Is Displayed     ${VALIDATION_EXISTING_USER}    Email Address already exist!






