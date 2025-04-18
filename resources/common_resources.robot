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
${VALIDATION_INVALID_CRED}    //*[@id="form"]//p
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
${RADIO_BUTTON_XPATH_TEMPLATE}    //input[@name='{name}'][@value='{value}']

*** Keywords ***
Go To Automation Exercise Home Page
    Open Browser    ${HOME_PAGE_LINK}       ${BROWSER}
    ${status}    ${message}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${CONFIRM_COOKIES}    timeout=10s
    Run Keyword If    '${status}' == 'PASS'    Click Element    ${CONFIRM_COOKIES}
    Wait Until Page Contains Element    ${HOME_CAROUSEL}

Go To Required Link
    [Arguments]    ${required_link}
    Go To Automation Exercise Home Page
    Click Link    ${required_link}

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

Check Expected Notifications
    [Arguments]    ${notification_locator}    ${expected_text}
    Wait Until Element Is Visible    ${notification_locator}
    ${notification_text}=  Get Text    ${notification_locator}
    Should Be Equal As Strings    ${notification_text}    ${expected_text}

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

Search For Product
    [Arguments]    ${search_locator}    ${product}   ${search_header_locator}
    Input Text    ${search_locator}    ${product}
    Click Button   ${SEARCH_BUTTON}
    ${header_text}=  Get Text  ${search_header_locator}
    Should Be Equal As Strings    ${header_text}    SEARCHED PRODUCTS

Input And Verify Text Field
    [Arguments]   ${field_locator}    ${field_text}
    Input Text    ${field_locator}    ${field_text}
    Textfield Should Contain    ${field_locator}    ${field_text}

Select And Validate Radio Button
    [Arguments]  ${name}  ${value}
    ${radio_button_locator}=  Replace String    ${RADIO_BUTTON_XPATH_TEMPLATE}    {name}    ${name}
    ${radio_button_locator}=  Replace String    ${radio_button_locator}    {value}    ${value}
    Click Element    ${radio_button_locator}
    ${is_selected}=  Get Element Attribute    ${radio_button_locator}  checked
    Should Be Equal As Strings    ${is_selected}    true




