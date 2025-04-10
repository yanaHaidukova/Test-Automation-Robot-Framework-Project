*** Settings ***
Library     SeleniumLibrary
Library     String
Library    Collections

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
${TITLE_RADIO_BUTTON}    title
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

*** Keywords ***
Check User Is Successfully Redirected To Enter Account Information Page
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Log    ${header_text}
    Should Be Equal  ${header_text}  ${expected_text}

Check User Can Select A Title
    [Arguments]  ${name}  ${value}
    ${xpath}=  Replace String  ${TITLE_RADIO_BUTTON}  {name}  ${name}
    ${xpath}=  Replace String  ${TITLE_RADIO_BUTTON}  {value}  ${value}
    Click Element  ${xpath}
    ${is_selected}=  Get Element Attribute  ${xpath}  checked
    Should Be Equal  ${is_selected}  true

Check User Name And Email Are Pre-populated
   [Arguments]    ${user_name}    ${user_email}
   Textfield Should Contain    ${NAME_FIELD_POPULATED}    ${valid_name}
   Textfield Should Contain    ${EMAIL_FIELD_POPULATED}   ${valid_email}

Check User Can Select Date Of Birth
    [Arguments]    ${day_locator}    ${day_value}    ${month_locator}    ${month_value}   ${year_locator}    ${year_value}
    Select From List By Value    ${day_locator}   ${day_value}
    ${day_selected}=  Get Selected List Value    ${day_locator}
    Should Be Equal    ${day_selected}    ${day_value}
    Select From List By Value    ${month_locator}   ${month_value}
    ${month_selected}=  Get Selected List Value    ${month_locator}
    Should Be Equal    ${month_selected}    ${month_value}
    Select From List By Value    ${year_locator}   ${year_value}
    ${year_selected}=  Get Selected List Value    ${year_locator}
    Should Be Equal    ${year_selected}    ${year_value}

Check User Can Create A Password
    [Arguments]     ${passcreate_locator}    ${pass_value}
    Input Password    ${passcreate_locator}    ${pass_value}
    ${pass_created}=    Get Value    ${passcreate_locator}
    Should Not Be Empty    ${pass_created}

Check User Can Add First Name
    [Arguments]    ${firstname_locator}    ${firstname_value}
    Input Text    ${firstname_locator}    ${firstname_value}
    ${added_name}=    Get Value    ${firstname_locator}
    Should Be Equal As Strings    ${added_name}    ${firstname_value}

Check User Can Add Second Name
    [Arguments]    ${secondname_locator}    ${secondname_value}
    Input Text    ${secondname_locator}    ${secondname_value}
    ${added_secondname}=    Get Value     ${secondname_locator}
    Should Be Equal As Strings    ${added_secondname}    ${secondname_value}

Check User Can Add Company
    [Arguments]    ${company_locator}    ${company_value}
    Input Text    ${company_locator}     ${company_value}
    ${added_company}=    Get Value     ${company_locator}
    Should Be Equal As Strings    ${added_company}     ${company_value}

Check User Can Add Address1
    [Arguments]    ${address1_locator}    ${address1_value}
    Input Text    ${address1_locator}     ${address1_value}
    ${added_address1}=    Get Value     ${address1_locator}
    Should Be Equal As Strings    ${added_address1}     ${address1_value}

Check User Can Add Address2
    [Arguments]    ${address2_locator}    ${address2_value}
    Input Text    ${address2_locator}     ${address2_value}
    ${added_address2}=    Get Value     ${address2_locator}
    Should Be Equal As Strings    ${added_address2}     ${address2_value}

Check User Can Select Country
    [Arguments]    ${country_locator}    ${country_value}
    Select From List By Value    ${country_locator}    ${country_value}
    ${added_country}=    Get Value     ${country_locator}
    Should Be Equal As Strings    ${added_country}      ${country_value}

Check User Can Add State
    [Arguments]    ${state_locator}    ${state_value}
    Input Text    ${state_locator}    ${state_value}
    ${added_state}=    Get Value     ${state_locator}
    Should Be Equal As Strings    ${added_state}    ${state_value}

Check User Can Add City
    [Arguments]    ${city_locator}    ${city_value}
    Input Text    ${city_locator}    ${city_value}
    ${added_city}=    Get Value     ${city_locator}
    Should Be Equal As Strings    ${added_city}     ${city_value}

Check User Can Add Zip Code
    [Arguments]    ${zip_locator}    ${zip_value}
    Input Text    ${zip_locator}    ${zip_value}
    ${added_zip}=    Get Value     ${zip_locator}
    Should Be Equal As Strings    ${added_zip}     ${zip_value}

Check User Can Add Phone Number
    [Arguments]    ${number_locator}    ${number_value}
    Input Text    ${number_locator}    ${number_value}
    ${added_number}=    Get Value     ${number_locator}
    Should Be Equal As Strings    ${added_number}     ${number_value}

Check User Can Sing Up for Newsletter
    Scroll Element Into View    ${COMPANY_NAME_ID}
    Wait Until Element Is Visible    ${SIGNUP_CHECKBOX}
    Select Checkbox    ${SIGNUP_CHECKBOX}
    ${is_selected}=  Get Element Attribute  ${SIGNUP_CHECKBOX}  checked
    Should Be Equal  ${is_selected}  true

Check Login To Your Account Section Is Visible
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Should Be Equal  ${header_text}  ${expected_text}

Check Logged In As Username Link Is Visible
    [Arguments]  ${username}
    ${header_text}=  Get Text  ${LOGGEDIN_SUCCESS}
    Should Contain  ${header_text}  ${username}

Check User Cannot Login With Invalid Credentials
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${ERROR_INVALID_CREDENTIALS_ID}
    ${message_text}=  Get Text  ${ERROR_INVALID_CREDENTIALS_ID}
    Log    ${message_text}
    Should Be Equal   ${message_text}  Your email or password is incorrect!

Check Account Already Exists
    [Arguments]    ${locator}    ${expected_text}
    Wait Until Element Is Visible  ${ERROR_EXISTING_USER_ID}
    ${message_text}=  Get Text  ${ERROR_EXISTING_USER_ID}
    Log    ${message_text}
    Should Be Equal   ${message_text}  Email Address already exist!


