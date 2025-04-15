*** Settings ***
Library      SeleniumLibrary
Resource    ../resources/login.robot
Resource    ../resources/contact_us.robot
Resource    ../resources/products.robot

*** Variables ***
${EMAIL_FIELD_LOGIN_ID}    //input[@name="email"][@data-qa="login-email"]
${CONTINUE_BUTTON_ID}    //*[@class="btn btn-primary"]
${LOGIN_BUTTON_ID}    //button[@type="submit"][@data-qa="login-button"]
${INVALID_USER_EMAIL}    hola@gmail.com
${LOGGOUT_BUTTON_ID}    //a[contains(text(),' Logout')]
${CONFIRM_COOKIES}    //*[@role="button"][@aria-label="Consent"]
${HEADER_LOCATOR_DELETED}    //*[text()= 'Account Deleted!']
${UPLOAD_FILE_LOCATOR}    //input[@name="upload_file"]
${ERROR_INVALID_CREDENTIALS_ID}    //*[@id="form"]//p
${INPUT_PASSWORD}    //input[@type="password"]
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

Check User Can Select A Checkbox
    [Arguments]   ${checkbox_locator}
    Select Checkbox    ${checkbox_locator}
    ${is_selected}=  Get Element Attribute  ${checkbox_locator}  checked
    Should Be Equal  ${is_selected}  true

Check User Is Logged Out From Account
    Wait Until Element Is Visible    ${HEADER_LOCATOR_LOGIN}
    ${header_text}=  Get Text    ${HEADER_LOCATOR_LOGIN}
    Should Be Equal As Strings    ${header_text}    Login to your account

Check Expected Notifications
    [Arguments]  ${header_locator}  ${expected_text}
    Wait Until Element Is Visible  ${header_locator}
    ${header_text}=  Get Text  ${header_locator}
    Should Be Equal  ${header_text}  ${expected_text}

Select Option From Drop Down
    [Arguments]    ${drop_down_locator}    ${drop_down_value}
    Select From List By Value    ${drop_down_locator}   ${drop_down_value}
    ${value_selected}=  Get Selected List Value    ${drop_down_locator}
    Should Be Equal    ${value_selected}    ${drop_down_value}

Login And Delete Account
    Open Browser    ${HOME_PAGE_LINK}    ${BROWSER}
    ${status}    ${message}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${CONFIRM_COOKIES}    timeout=10s
    Run Keyword If    '${status}' == 'PASS'    Click Element    ${CONFIRM_COOKIES}
    Wait Until Page Contains Element    ${HOME_CAROUSEL}
    Click Link    ${SIGNUP_LOGIN_LINK}
    Wait Until Element Is Visible    ${HEADER_LOCATOR_NEW_SIGNIN}
    Check Usen Can Log In With Valid Credentials    ${VALID_EMAIL}    ${PASSWORD_VALUE}   ${VALID_NAME}    ${LOGGEDIN_SUCCESS}
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

Check Relevant Validation Message Is Shown
    [Arguments]    ${locator}    ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${message_text}=  Get Text  ${locator}
    Should Be Equal   ${message_text}  ${expected_text}

Input And Verify Text Field
    [Arguments]   ${field_locator}    ${field_text}
    Input Text    ${field_locator}    ${field_text}
    Wait Until Element Is Visible    ${field_locator}
    Textfield Should Contain    ${field_locator}    ${field_text}

Validate Radio Button Is Selected
    [Arguments]   ${locator_template}    ${name}    ${value}    ${attribute}    ${expected_value}
    ${locator}=    Replace String    ${locator_template}    {name}    ${name}
    ${locator}=    Replace String    ${locator}    {value}    ${value}
    Click Element    ${locator}
    ${actual_value}=    Get Element Attribute    ${locator}    ${attribute}
    Should Be Equal    ${actual_value}    ${expected_value}

Check Text Field Pre-Populated
   [Arguments]   ${field_locator}   ${field_value}
   Textfield Should Contain    ${field_locator}    ${field_value}

Check Logged In As Username Link Is Visible
    [Arguments]  ${username}
    ${header_text}=  Get Text  ${LOGGEDIN_SUCCESS}
    Should Contain  ${header_text}  ${username}




