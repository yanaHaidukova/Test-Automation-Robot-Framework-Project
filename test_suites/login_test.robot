*** Settings ***
Resource    ../resources/common_resources.robot
Resource    ../resources/login.robot
Test Setup    Go To Required Link    ${SIGNUP_LOGIN_LINK}
Suite Teardown    Login And Delete Account

*** Variables ***
${NAME_FIELD_ID}    //input[@name="name"]
${VALID_NAME}    Lora
${EMAIL_FIELD_ID}    //input[@name="email"][@data-qa="signup-email"]
${VALID_EMAIL}    loratestemail@gmail.com
${HEADER_ACCOUNT_INFO}    //*[@class="login-form"]/h2
${EMAIL_FIELD_LOGIN_ID}    //input[@name="email"][@data-qa="login-email"]
${INVALID_USER_EMAIL}    hola@gmail.com
${INVALID_PASSWORD}    invalidpass1
${CREATE_ACCOUNT_BUTTON}    //button[@type="submit"][@data-qa="create-account"]
${CONTINUE_BUTTON_ID}    //*[@class="btn btn-primary"]
${VALIDATION_EXISTING_USER}    //*[@id="form"]//p
${ACCOUNT_CREATED_ID}    //*[@id="form"]//h2[@data-qa="account-created"]
${HEADER_LOCATOR_NEW_SIGNIN}    //*[@class="signup-form"]//h2
${SIGNUP_LOGIN_LINK}    //*[@id="header"]//a[@href="/login"]
${HEADER_LOCATOR_LOGIN}    //*[@class="login-form"]//h2

*** Test Cases ***
Verify New User Registration
    [Tags]  UI_tests_Part1
    Check Relevant Text Is Displayed    ${HEADER_LOCATOR_NEW_SIGNIN}    New User Signup!
    Input And Verify Text Field    ${NAME_FIELD_ID}    ${VALID_NAME}
    Input And Verify Text Field     ${EMAIL_FIELD_ID}    ${VALID_EMAIL}
    Click Button    ${SIGNUP_BUTTON}
    Check Relevant Text Is Displayed    ${HEADER_ACCOUNT_INFO}    ENTER ACCOUNT INFORMATION
    Check User Can Enter Account Information
    Scroll Element Into View    ${COMPANY_NAME_ID}
    Wait Until Element Is Visible    ${SIGNUP_CHECKBOX}
    Check User Can Select A Checkbox    ${SIGNUP_CHECKBOX}
    Check User Can Enter Address Information
    Click Button    ${CREATE_ACCOUNT_BUTTON}
    Wait Until Element Is Visible      ${ACCOUNT_CREATED_ID}
    Click Link    ${CONTINUE_BUTTON_ID}
    Element Should Contain    ${LOGGEDIN_SUCCESS}    ${VALID_NAME}

Verify User Can Login With Correct Email And Password
    [Tags]  UI_tests_Part1
    Check Relevant Text Is Displayed    ${HEADER_LOCATOR_LOGIN}    Login to your account
    Check Usen Can Log In With Valid Credentials    ${VALID_EMAIL}    ${PASSWORD_VALUE}    ${VALID_NAME}    ${LOGGEDIN_SUCCESS}

Verify User Cannot Login With Incorrect Email And Password
    [Tags]  UI_tests_Part1
    Check Relevant Text Is Displayed    ${HEADER_LOCATOR_LOGIN}    Login to your account
    Input And Verify Text Field    ${EMAIL_FIELD_LOGIN_ID}    ${INVALID_USER_EMAIL}
    Input And Verify Text Field    ${INPUT_PASSWORD}    ${INVALID_PASSWORD}
    Click Button  ${LOGIN_BUTTON_ID}
    Check Relevant Text Is Displayed    ${VALIDATION_INVALID_CRED}    Your email or password is incorrect!

Verify User Log Out Flow
    [Tags]  UI_tests_Part1
    Check Relevant Text Is Displayed    ${HEADER_LOCATOR_LOGIN}    Login to your account
    Check Usen Can Log In With Valid Credentials    ${VALID_EMAIL}    ${PASSWORD_VALUE}   ${VALID_NAME}    ${LOGGEDIN_SUCCESS}
    Click Link  ${LOGGOUT_BUTTON_ID}
    Check Relevant Text Is Displayed    ${HEADER_LOCATOR_LOGIN}    Login to your account

Verify User Registration With Existing Email
    [Tags]  UI_tests_Part1
    Check Relevant Text Is Displayed    ${HEADER_LOCATOR_NEW_SIGNIN}    New User Signup!
    Input And Verify Text Field    ${NAME_FIELD_ID}    ${VALID_NAME}
    Input And Verify Text Field   ${EMAIL_FIELD_ID}    ${VALID_EMAIL}
    Click Button    ${SIGNUP_BUTTON}
    Check Relevant Text Is Displayed    ${VALIDATION_EXISTING_USER}    Email Address already exist!


