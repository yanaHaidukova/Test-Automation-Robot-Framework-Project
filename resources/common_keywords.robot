*** Settings ***
Library      SeleniumLibrary
Resource    ../resources/PO/login.robot
Resource    ../resources/PO/search.robot
Resource    ../resources/PO/top_nav.robot
Resource    ../resources/PO/home.robot
Resource    ../resources/PO/contact_us.robot
Resource    ../resources/PO/products.robot
Resource    ../resources/PO/test_cases.robot
Resource    ../resources/created_keywrods.robot

*** Variables ***
${EMAIL_FIELD_LOGIN_ID} =  xpath=//input[@name="email"] [@data-qa="login-email"]
${VALID_NAME} =  Eva Get In Touch
${LOGGED_IN_USER_NAME} =  alex
${LOGGEDIN_HEADER_TEXT} =  Logged in as
${CONTINUE_BUTTON_ID} =  xpath=//*[@class="btn btn-primary"]
${LOGIN_BUTTON_ID} =  xpath=//button[@type="submit"] [@data-qa="login-button"]
${INVALID_USER_EMAIL} =  hola@gmail.com
${LOGGEN_IN_USER_PASSWORD} =  test
${INPUT_PASSWORD} =  //input[@type="password"]
${INVALID_PASSWORD} =  invalidpass1
${LOGGOUT_BUTTON_ID} =  //a[@href="/logout"]
${FOOTER_LOCATOR} =  xpath=//div[@class="single-widget"]
${SUBSCRIBE_BUTTON} =  id=subscribe
${SUBSCRIBE_MESSAGE} =  You have been successfully subscribed!
${SNACKBAR_LOCATOR} =  id=success-subscribe
${CONFIRM_COOKIES} =  xpath=//*[@role="button"] [@aria-label="Consent"]



*** Keywords ***

Resize browser window
    Maximize Browser Window

Verify that a new user is successfully logged in
    Verify that 'Logged in as username' is visible     ${VALID_NAME}

Verify that user is successfully logged in
    Verify that 'Logged in as username' is visible     ${VALID_NAME}

Delete user account
    Click "Delete Account" link

Login user
    Go to "Automation exercise" website
    Resize browser window
    Confirm cookies
    Verify that home page is visible
    Click "Signup/Login" link in the navigation menu
    Input valid email     ${EMAIL_FIELD_LOGIN_ID}   ${LOGGED_IN_USER_EMAIL}
    Fill in a "Password" field     ${INPUT_PASSWORD}      ${LOGGEN_IN_USER_PASSWORD}
    Click "Login" button

Log out from account
    Click "Logout" button   ${LOGGOUT_BUTTON_ID}

Scroll the page down to the footer
    Scroll Element Into View    ${FOOTER_LOCATOR}

Click "Subscribe" button
    Click Button    ${SUBSCRIBE_BUTTON}

Verify that user is successfully subscribed
    Verify success message 'You have been successfully subscribed!' is visible     ${SNACKBAR_LOCATOR}  ${SUBSCRIBE_MESSAGE}

Confirm cookies
    Accept Cookies If Dialog Appears    ${CONFIRM_COOKIES}

Finish test
    Delete user account
    Verify account is successfully deleted
    Close All Browsers