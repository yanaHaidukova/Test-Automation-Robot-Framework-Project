*** Settings ***
Library     SeleniumLibrary
Library     String
Library    Collections
Resource     ../resources/common_resources.robot

*** Variables ***
${NAME_FIELD_ID}    //input[@name="name"]
${VALID_NAME}    Monika
${EMAIL_FIELD_ID}    //input[@name="email"][@data-qa="signup-email"]
${VALID_EMAIL}    Monikatestemail@gmail.com
${DAY_DROPDOWN}    //*[@id="days"]
${MONTH_DROPDOWN}    //*[@id="months"]
${YEAR_DROPDOWN}    //*[@id="years"]
${SIGNUP_CHECKBOX}    //*[@id="newsletter"]
${CONTINUE_BUTTON_ID}    //*[@class="btn btn-primary"]
${HEADER_LOCATOR_ACCOUNT_INFO}    //*[@class="login-form"]/h2
${NAME_FIELD_POPULATED}    //input[@id="name"]
${EMAIL_FIELD_POPULATED}    //input[@id="email"]
${LOGIN_BUTTON_ID}    //button[@type="submit"][@data-qa="login-button"]
${COMPANY_NAME_ID}    //*[@id="company"]
${STATE_ID}    //*[@id="state"]
${EMAIL_FIELD_LOGIN_ID}    //input[@name="email"][@data-qa="login-email"]
${INPUT_PASSWORD}    //input[@type="password"]
${VALIDATION_EXISTING_USER}    //*[@id="form"]//p
${HEADER_LOCATOR_LOGIN}    //*[@class="login-form"]//h2
${LOGGEDIN_SUCCESS}    //*[@id="header"]//li[10]/a
${PASSWORD_FIELD_ID}    //*[@id="password"]
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
    Check Relevant Text Is Displayed    ${LOGGEDIN_SUCCESS}    	Logged in as ${username}

Check User Can Create A Password
    Input Password    ${PASSWORD_FIELD_ID}     ${PASSWORD_VALUE}
    ${pass_created}=    Get Value    ${PASSWORD_FIELD_ID}
    Should Not Be Empty    ${pass_created}

Check User Can Enter Account Information
    [Arguments]    ${name}   ${email}
    Select And Validate Radio Button    title    Mr
    Textfield Should Contain   ${NAME_FIELD_POPULATED}    ${name}
    Textfield Should Contain     ${EMAIL_FIELD_POPULATED}    ${email}
    Check User Can Create A Password
    Select Option From Drop Down    ${DAY_DROPDOWN}    1
    Select Option From Drop Down    ${MONTH_DROPDOWN}    4
    Select Option From Drop Down    ${YEAR_DROPDOWN}     1999

Check User Can Enter Address Information
    [Arguments]    ${name}    ${last_name}    ${company}    ${address1}    ${address2}   ${country}    ${state}    ${city}    ${zip_code}    ${phone}
    Input And Verify Text Field    ${FIRST_NAME_ID}    ${name}
    Input And Verify Text Field    ${LAST_NAME_ID}   ${last_name}
    Input And Verify Text Field    ${COMPANY_NAME_ID}     ${company}
    Input And Verify Text Field    ${ADDRESS1_ID}   ${address1}
    Input And Verify Text Field    ${ADDRESS2_ID}     ${address2}
    Select Option From Drop Down    ${COUNTRY_DROPDOWN_ID}    ${country}
    Input And Verify Text Field    ${STATE_ID}    ${state}
    Input And Verify Text Field    ${CITY_ID}     ${city}
    Input And Verify Text Field    ${ZIPCODE_ID}    ${zip_code}
    Input And Verify Text Field    ${MOBILE_NUMBER_ID}     ${phone}


