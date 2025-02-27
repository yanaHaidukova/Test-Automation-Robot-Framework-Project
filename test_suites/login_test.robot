*** Settings ***
Resource    ../resources/created_keywrods.robot
Resource    ../resources/common_keywords.robot
Test Teardown   Close All Browsers

#robot -d results test_suites/login_test.robot

*** Variables ***
${HEADER_LOCATOR_NEW_SIGNIN} =  xpath=//div[@class="signup-form"]//h2
${EXPECTED_HEADER_TEXT_NEWSIGNIN} =  New User Signup!
${NAME_FIELD_ID} =  xpath=//input[@name="name"]
${VALID_NAME} =  Eva
${EMAIL_FIELD_ID} =  xpath=//input[@name="email"] [@data-qa="signup-email"]
${VALID_EMAIL} =  evatestemail@gmail.com
${HEADER_LOCATOR_ACCOUNT_INFO} =  xpath=//div[@class="login-form"]/h2
${EXPECTED_HEADER_TEXT_ACCOUNT_INFO} =   ENTER ACCOUNT INFORMATION
${TITLE_RADIO_BUTTON_GROUP} =  title
${MR_RADIO_BUTTON_TITLE} =  Mr
${NAME_FIELD_POPULATED} =  id=name
${EMAIL_FIELD_POPULATED} =  id=email
${PASSWORD_FIELD_ID} =  id=password
${PASSWORD_VALUE} =  PASSWORD123
${DAY_DROPDOWN} =  id=days
${DAY_VALUE} =  4
${MONTH_DROPDOWN} =  id=months
${MONTH_VALUE} =  5
${YEAR_DROPDOWN} =  id=years
${YEAR_VALUE} =  1999
${SIGNUP_CHECKBOX} =  id=newsletter
${HEADER_LOCATOR_ACCOUNT_INFO} =  xpath=//div[@class="login-form"]/h2
${FIRST_NAME_ID} =  id=first_name
${LAST_NAME_ID} =  id=last_name
${LAST_NAME_VALUE} =  Patison
${COMPANY_NAME_ID} =  id=company
${COMPANY_NAME_VALUE} =  SoftServe
${ADDRESS1_ID} =  id=address1
${ADDRESS1_VALUE} =  Test address 1
${ADDRESS2_ID} =  id=address2
${ADDRESS2_VALUE} =  Test address 2
${COUNTRY_DROPDOWN_ID} =  id=country
${COUNTRY_DROPDOWN_VALUE} =  Canada
${STATE_ID} =  id=state
${STATE_VALUE} =  Ontario
${CITY_ID} =  id=city
${CITY_VALUE} =  Toronto
${ZIPCODE_ID} =  id=zipcode
${ZIPCODE_VALUE} =  123456
${MOBILE_NUMBER_ID} =  id=mobile_number
${MOBILE_NUMBER_VALUE} =  +12505550199
${HEADER_LOCATOR_LOGIN} =  //div[@class="login-form"]//h2
${EXPECTED_HEADER_TEXT_LOGIN} =  Login to your account
${EMAIL_FIELD_LOGIN_ID} =  xpath=//input[@name="email"] [@data-qa="login-email"]
${LOGGED_IN_USER_EMAIL} =  alexxx@gmail.com
${INVALID_USER_EMAIL} =  hola@gmail.com
${INPUT_PASSWORD} =  //input[@type="password"]
${INVALID_PASSWORD} =  invalidpass1

*** Test Cases ***
Test Case 1: Register user
    [Tags]  UI tests Part 1
    Go to "Automation exercise" website
    Resize browser window
    Confirm cookies
    Verify that home page is visible
    Click "Signup/Login" link in the navigation menu
    Verify that a "New User Signup!" section is visible     ${HEADER_LOCATOR_NEW_SIGNIN}     ${EXPECTED_HEADER_TEXT_NEWSIGNIN}
    Input valid user name   ${NAME_FIELD_ID}    ${VALID_NAME}
    Input valid email   ${EMAIL_FIELD_ID}   ${VALID_EMAIL}
    Click "Sign up" button
    Verify user successfully redirected to "Enter Account Information" page   ${HEADER_LOCATOR_ACCOUNT_INFO}  ${EXPECTED_HEADER_TEXT_ACCOUNT_INFO}
    Select "Title" Radio Button     ${TITLE_RADIO_BUTTON_GROUP}     ${MR_RADIO_BUTTON_TITLE}
    Verify user name is pre-populated   ${NAME_FIELD_POPULATED}      ${VALID_NAME}
    Verify user email is pre-populated  ${EMAIL_FIELD_POPULATED}    ${VALID_EMAIL}
    Fill in a "Password" field   ${PASSWORD_FIELD_ID}       ${PASSWORD_VALUE}
    Select a day of birth from the drop-down    ${DAY_DROPDOWN}     ${DAY_VALUE}
    Select a month of birth from the drop-down  ${MONTH_DROPDOWN}   ${MONTH_VALUE}
    Select year of birth from the drop-down     ${YEAR_DROPDOWN}    ${YEAR_VALUE}
    Verify "Address Information" section is visible
    Select "Sign up for our newsletter!" checkbox   ${SIGNUP_CHECKBOX}
    Input valid user name   ${FIRST_NAME_ID}      ${VALID_NAME}
    Input valid last name   ${LAST_NAME_ID}     ${LAST_NAME_VALUE}
    Input valid company name    ${COMPANY_NAME_ID}   ${COMPANY_NAME_VALUE}
    Input valid address     ${ADDRESS1_ID}     ${ADDRESS1_VALUE}
    Input valid address 2   ${ADDRESS2_ID}     ${ADDRESS2_VALUE}
    Select "Country" from the drop-down list    ${COUNTRY_DROPDOWN_ID}  ${COUNTRY_DROPDOWN_VALUE}
    Input valid State    ${STATE_ID}     ${STATE_VALUE}
    Input valid City     ${CITY_ID}      ${CITY_VALUE}
    Input valid Zipcode number  ${ZIPCODE_ID}       ${ZIPCODE_VALUE}
    Input valid mobile number   ${MOBILE_NUMBER_ID}     ${MOBILE_NUMBER_VALUE}
    Click "Create account" button
    Verify that account is successfully created
    Click "Continue" button
    Verify that a new user is successfully logged in

Test Case 2: Login User with correct email and password
    [Tags]  UI tests Part 1
    Go to "Automation exercise" website
    Resize browser window
    Confirm cookies
    Verify that home page is visible
    Click "Signup/Login" link in the navigation menu
    Verify that a "Login to your account" section is visible    ${HEADER_LOCATOR_LOGIN}         ${EXPECTED_HEADER_TEXT_LOGIN}
    Input valid email   ${EMAIL_FIELD_LOGIN_ID}   ${VALID_EMAIL}
    Fill in a "Password" field    ${INPUT_PASSWORD}      ${PASSWORD_VALUE}
    Click "Login" button
    Verify that user is successfully logged in
    Delete user account
    Verify account is successfully deleted

Test Case 3: Login User with incorrect email and password
    [Tags]  UI tests Part 1
    Go to "Automation exercise" website
    Resize browser window
    Confirm cookies
    Verify that home page is visible
    Click "Signup/Login" link in the navigation menu
    Verify that a "Login to your account" section is visible    ${HEADER_LOCATOR_LOGIN}         ${EXPECTED_HEADER_TEXT_LOGIN}
    Input incorrect email into the "Email address" field    ${EMAIL_FIELD_LOGIN_ID}     ${INVALID_USER_EMAIL}
    Fill in a "Password" field     ${INPUT_PASSWORD}       ${INVALID_PASSWORD}
    Click "Login" button
    Verify user cannot login

Test Case 4: Logout User
    [Tags]  UI tests Part 1
    [Setup]   Login user
    Log out from account
    Verify that a "Login to your account" section is visible    ${HEADER_LOCATOR_LOGIN}         ${EXPECTED_HEADER_TEXT_LOGIN}

Test Case 5: Register User with existing email
    [Tags]  UI tests Part 1
    Go to "Automation exercise" website
    Resize browser window
    Confirm cookies
    Verify that home page is visible
    Click "Signup/Login" link in the navigation menu
    Verify that a "Login to your account" section is visible    ${HEADER_LOCATOR_LOGIN}         ${EXPECTED_HEADER_TEXT_LOGIN}
    Input existing user name    ${NAME_FIELD_ID}     ${LOGGED_IN_USER_NAME}
    Input existing email        ${EMAIL_FIELD_ID}   ${LOGGED_IN_USER_EMAIL}
    Click "Sign up" button
    Verify user cannot create an account


