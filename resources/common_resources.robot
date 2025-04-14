*** Settings ***
Library      SeleniumLibrary
Resource    ../resources/login.robot
Resource    ../resources/contact_us.robot
Resource    ../resources/products.robot
Resource    ../resources/test_cases.robot

*** Variables ***
${EMAIL_FIELD_LOGIN_ID}    //input[@name="email"][@data-qa="login-email"]
${LOGGEDIN_HEADER_TEXT}    Logged in as
${CONTINUE_BUTTON_ID}    //*[@class="btn btn-primary"]
${LOGIN_BUTTON_ID}    //button[@type="submit"][@data-qa="login-button"]
${INVALID_USER_EMAIL}    hola@gmail.com
${LOGGEN_IN_USER_PASSWORD}    test
${INPUT_PASSWORD}    //input[@type="password"]
${INVALID_PASSWORD}    invalidpass1
${LOGGOUT_BUTTON_ID}    //a[contains(text(),' Logout')]
${CONFIRM_COOKIES}    //*[@role="button"][@aria-label="Consent"]
${HEADER_LOCATOR_DELETED}    //*[text()= 'Account Deleted!']
${UPLOAD_FILE_LOCATOR}    //input[@name="upload_file"]
${ERROR_INVALID_CREDENTIALS_ID}    //*[@id="form"]//p
${PASSWORD_FIELD_ID}    //*[@id="password"]
${PASSWORD_VALUE}    PASSWORD123
${DAY_DROPDOWN}    //*[@id="days"]
${MONTH_DROPDOWN}    //*[@id="months"]
${YEAR_DROPDOWN}    //*[@id="years"]
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
${EMAIL_FIELD_LOGIN_ID}    //input[@name="email"][@data-qa="login-email"]
${INPUT_PASSWORD}    //input[@type="password"]
${CONFIRM_COOKIES}    //*[@role="button"][@aria-label="Consent"]
${HOME_PAGE_LINK}    https://automationexercise.com
${BROWSER}    headlesschrome
${HOME_CAROUSEL}    //*[@id="slider-carousel"]
${HEADER_LOCATOR_NEW_SIGNIN}    //*[@class="signup-form"]//h2
${HEADER_LOCATOR_LOGIN}    //*[@class="login-form"]//h2
${SIGNUP_LOGIN_LINK}    //*[@id="header"]//a[@href="/login"]
${HEADER_LOCATOR_LOGIN}    //*[@class="login-form"]//h2
${SIGNUP_BUTTON}    //button[@type="submit"][@data-qa="signup-button"]
${LOGGEDIN_SUCCESS}     //*[@id="header"]//li[10]/a
${DELETE_ACCOUNT_LINK}    //a[contains (text(), 'Delete Account')]

*** Keywords ***
Go To Automation Exercise Home Page
    Open Browser    ${HOME_PAGE_LINK}       ${BROWSER}
    ${status}    ${message}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${CONFIRM_COOKIES}    timeout=10s
    Run Keyword If    '${status}' == 'PASS'    Click Element    ${CONFIRM_COOKIES}
    Wait Until Page Contains Element    ${HOME_CAROUSEL}

Check User Is Redirected To The Selected Page
    [Arguments]   ${header_locator}   ${expected_header}
    Wait Until Element Is Visible    ${header_locator}
    ${header_text}=  Get Text    ${header_locator}
    Should Be Equal As Strings    ${header_text}   ${expected_header}

Check User Can Enter Account Information
    Check User Can Select A Title    ${TITLE_RADIO_BUTTON}    Mr
    Check User Name And Email Are Pre-populated    ${VALID_NAME}    ${VALID_EMAIL}
    Check User Can Create A Password    ${PASSWORD_FIELD_ID}    ${PASSWORD_VALUE}
    Check User Can Select Date Of Birth    ${DAY_DROPDOWN}   1   ${MONTH_DROPDOWN}    4     ${YEAR_DROPDOWN}    1999

Check User Can Enter Address Information
    Check User Can Add First Name    ${FIRST_NAME_ID}    ${VALID_NAME}
    Check User Can Add Second Name    ${LAST_NAME_ID}    Patison
    Check User Can Add Company    ${COMPANY_NAME_ID}    SoftServe
    Check User Can Add Address1    ${ADDRESS1_ID}    Test address 1
    Check User Can Add Address2    ${ADDRESS2_ID}    Test address 2
    Check User Can Select Country    ${COUNTRY_DROPDOWN_ID}    Canada
    Check User Can Add State     ${STATE_ID}    Ontario
    Check User Can Add City    ${CITY_ID}    Toronto
    Check User Can Add Zip Code    ${ZIPCODE_ID}    123456
    Check User Can Add Phone Number    ${MOBILE_NUMBER_ID}    +12505550199

Check Usen Can Log In With Valid Credentials
    [Arguments]  ${email}    ${password}    ${username}
    Input Text  ${EMAIL_FIELD_LOGIN_ID}  ${email}
    Input Text  ${INPUT_PASSWORD}  ${password}
    Click Button  ${LOGIN_BUTTON_ID}
    Wait Until Element Is Visible    ${LOGGEDIN_SUCCESS}
    ${header_text}=  Get Text  ${LOGGEDIN_SUCCESS}
    Should Contain  ${header_text}  ${username}

Check User Can Input User Name And Email
    [Arguments]  ${username_locator}  ${username}  ${email_locator}  ${email}
    Input Text  ${username_locator}  ${username}
    Input Text  ${email_locator}  ${email}
    ${entered_username}=  Get Value  ${username_locator}
    ${entered_email}=  Get Value  ${email_locator}
    Should Be Equal  ${entered_username}  ${username}
    Should Be Equal  ${entered_email}  ${email}

Check User Is Logged Out From Account
    Click Link  ${LOGGOUT_BUTTON_ID}
    Wait Until Element Is Visible    ${HEADER_LOCATOR_LOGIN}
    ${header_text}=  Get Text    ${HEADER_LOCATOR_LOGIN}
    Should Be Equal As Strings    ${header_text}    Login to your account

Check Expected Notifications
    [Arguments]  ${header_locator}  ${expected_text}
    Wait Until Element Is Visible  ${header_locator}
    ${header_text}=  Get Text  ${header_locator}
    Should Be Equal  ${header_text}  ${expected_text}

Login And Delete Account
    [Arguments]  ${username}
    Open Browser    ${HOME_PAGE_LINK}    ${BROWSER}
    ${status}    ${message}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${CONFIRM_COOKIES}    timeout=10s
    Run Keyword If    '${status}' == 'PASS'    Click Element    ${CONFIRM_COOKIES}
    Wait Until Page Contains Element    ${HOME_CAROUSEL}
    Click Link    ${SIGNUP_LOGIN_LINK}
    Wait Until Element Is Visible    ${HEADER_LOCATOR_NEW_SIGNIN}
    Input Text    ${EMAIL_FIELD_LOGIN_ID}  ${valid_email}
    Input Text    ${INPUT_PASSWORD}  ${password_value}
    Click Button    ${LOGIN_BUTTON_ID}
    Wait Until Element Is Visible    ${LOGGEDIN_SUCCESS}
    ${header_text}=  Get Text  ${LOGGEDIN_SUCCESS}
    Should Contain  ${header_text}  ${username}
    Click Link    ${DELETE_ACCOUNT_LINK}
    Wait Until Element Is Visible    ${HEADER_LOCATOR_DELETED}
    Close All Browsers

Create And Upload File
    [Arguments]    ${file_name}    ${file_content}
    Create File    ${CURDIR}/${file_name}    ${file_content}
    File Should Exist    ${CURDIR}/${file_name}
    Choose File    ${UPLOAD_FILE_LOCATOR}    ${CURDIR}/${file_name}
    Should Not Be Empty    ${UPLOAD_FILE_LOCATOR}

Check Account Is Successfully Deleted
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${HEADER_LOCATOR_DELETED}
    ${header_text}=  Get Text  ${HEADER_LOCATOR_DELETED}
    Should Be Equal  ${header_text}  ACCOUNT DELETED!

Search For Product
    [Arguments]    ${search_locator}    ${product}   ${search_header_locator}
    Input Text    ${search_locator}    ${product}
    Click Button   ${SEARCH_BUTTON}
    ${header_text}=  Get Text  ${search_header_locator}
    Should Be Equal As Strings    ${header_text}    SEARCHED PRODUCTS




