*** Settings ***
Library     SeleniumLibrary
Library     String
Library    Collections
Resource     ../resources/common_resources.robot

*** Variables ***
${NAME_FIELD_ID}    //input[@name="name"]
${VALID_NAME}    Eva
${EMAIL_FIELD_ID}    //input[@name="email"][@data-qa="signup-email"]
${VALID_EMAIL}    evatestemail@gmail.com
${DAY_DROPDOWN}    //*[@id="days"]
${MONTH_DROPDOWN}    //*[@id="months"]
${YEAR_DROPDOWN}    //*[@id="years"]
${SIGNUP_CHECKBOX}    //*[@id="newsletter"]
${CONTINUE_BUTTON_ID}    //*[@class="btn btn-primary"]
${HEADER_LOCATOR_ACCOUNT_INFO}    //*[@class="login-form"]/h2
${TITLE_RADIO_BUTTON}    //*[@name="title"]
${NAME_FIELD_POPULATED}    //input[@id="name"]
${EMAIL_FIELD_POPULATED}    //input[@id="email"]
${LOGIN_BUTTON_ID}    //button[@type="submit"][@data-qa="login-button"]
${COMPANY_NAME_ID}    //*[@id="company"]
${STATE_ID}    //*[@id="state"]
${EMAIL_FIELD_LOGIN_ID}    //input[@name="email"][@data-qa="login-email"]
${INPUT_PASSWORD}    //input[@type="password"]
${ERROR_INVALID_CREDENTIALS_ID}    //p[contains(text(), 'Your email or password is incorrect!')]
${ERROR_EXISTING_USER_ID}    //*[@id="form"]//p
${HEADER_LOCATOR_LOGIN}    //*[@class="login-form"]//h2
${LOGGEDIN_SUCCESS}    //*[@id="header"]//li[10]/a
${PASSWORD_FIELD_ID}    //*[@id="password"]
${PASSWORD_VALUE}    PASSWORD123
${FIRST_NAME_ID}    //*[@id="first_name"]
${LAST_NAME_ID}    //*[@id="last_name"]
${COMPANY_NAME_ID}    //*[@id="company"]
${ADDRESS1_ID}    //*[@id="address1"]
${ADDRESS2_ID}    //*[@id="address2"]
${COUNTRY_DROPDOWN_ID}    //*[@id="country"]
${STATE_ID}    //*[@id="state"]
${CITY_ID}    //*[@id="city"]
${ZIPCODE_ID}    //*[@id="zipcode"]
${MOBILE_NUMBER_ID}    //*[@id="mobile_number"]

*** Keywords ***
Check Usen Can Log In With Valid Credentials
    [Arguments]    ${email}    ${password}    ${username}   ${success_notification}
    Input Text    ${EMAIL_FIELD_LOGIN_ID}   ${email}
    Input Text    ${INPUT_PASSWORD}    ${password}
    Click Button  ${LOGIN_BUTTON_ID}
    Wait Until Element Is Visible    ${LOGGEDIN_SUCCESS}
    ${header_text}=  Get Text    ${success_notification}
    Should Contain  ${header_text}  ${username}

Check User Can Enter Account Information
    Validate Radio Button Is Selected    ${TITLE_RADIO_BUTTON}    title    Mr    checked    true
    Check Text Field Pre-Populated   ${NAME_FIELD_POPULATED}    ${VALID_NAME}
    Check Text Field Pre-Populated     ${EMAIL_FIELD_POPULATED}    ${VALID_EMAIL}
    Check User Can Create A Password    ${PASSWORD_FIELD_ID}    ${PASSWORD_VALUE}
    Select Option From Drop Down    ${DAY_DROPDOWN}    1
    Select Option From Drop Down    ${MONTH_DROPDOWN}    4
    Select Option From Drop Down    ${YEAR_DROPDOWN}     1999

Check User Can Create A Password
    [Arguments]     ${passcreate_locator}    ${pass_value}
    Input Password    ${passcreate_locator}    ${pass_value}
    ${pass_created}=    Get Value    ${passcreate_locator}
    Should Not Be Empty    ${pass_created}

Check User Can Enter Address Information
    Input And Verify Text Field    ${FIRST_NAME_ID}    ${VALID_NAME}
    Input And Verify Text Field    ${LAST_NAME_ID}    Patison
    Input And Verify Text Field    ${COMPANY_NAME_ID}    SoftServe
    Input And Verify Text Field    ${ADDRESS1_ID}    Test address 1
    Input And Verify Text Field    ${ADDRESS2_ID}    Test address 2
    Select Option From Drop Down    ${COUNTRY_DROPDOWN_ID}    Canada
    Input And Verify Text Field    ${STATE_ID}    Ontario
    Input And Verify Text Field    ${CITY_ID}    Toronto
    Input And Verify Text Field    ${ZIPCODE_ID}    123456
    Input And Verify Text Field    ${MOBILE_NUMBER_ID}    +12505550199


