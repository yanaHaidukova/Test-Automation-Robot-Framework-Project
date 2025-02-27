*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SIGNUP_BUTTON} =  xpath=//button[@type="submit"] [@data-qa="signup-button"]
${CREATE_ACCOUNT_BUTTON} =  xpath=//button[@type="submit"] [@data-qa="create-account"]
${CONTINUE_BUTTON_ID} =  xpath=//*[@class="btn btn-primary"]
${HEADER_LOCATOR_ACCOUNT_INFO} =  xpath=//div[@class="login-form"]/h2
${HEADER_LOCATOR_NEW_SIGNIN} =  xpath=//div[@class="signup-form"]//h2
${EXPECTED_HEADER_TEXT_NEWSIGNIN} =  New User Signup!
${LOGIN_BUTTON_ID} =  xpath=//button[@type="submit"] [@data-qa="login-button"]
${COMPANY_NAME_ID} =  id=company




*** Keywords ***
Verify that a "New User Signup!" section is visible
     [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Should Be Equal  ${header_text}  ${expected_text}

Input valid user name
    [Arguments]     ${name_field_id}    ${valid_name}
    Input Text    ${name_field_id}    ${valid_name}

Input valid email
     [Arguments]     ${email_field_id}    ${email_name}
     Input Text     ${email_field_id}   ${email_name}

Verify user successfully redirected to "Enter Account Information" page
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Should Be Equal  ${header_text}  ${expected_text}

Input existing user name
    [Arguments]     ${name_field_id}    ${existing_name}
    Input Text    ${name_field_id}    ${existing_name}

Input existing email
     [Arguments]     ${email_field_id}    ${email_name}
     Input Text     ${email_field_id}   ${email_name}

Input incorrect email into the "Email address" field
     [Arguments]     ${email_field_id}    ${invalid_email_name}
     Input Text     ${email_field_id}   ${invalid_email_name}

Click "Sign up" button
    Click Button    ${SIGNUP_BUTTON}

Select "Title" Radio Button
    [Arguments]  ${name}  ${value}
    Click Element  xpath=//input[@type='radio' and @name='${name}' and @value='${value}']

Verify user name is pre-populated
    [Arguments]  ${name_field_populated}  ${valid_name}
    Textfield Should Contain    ${name_field_populated}    ${valid_name}

Verify user email is pre-populated
    [Arguments]  ${email_field_populated}  ${valid_email}
    Textfield Should Contain    ${email_field_populated}   ${valid_email}

Fill in a "Password" field
    [Arguments]  ${password_field_id}   ${password_value}
    Input Password    ${password_field_id}    ${password_value}

Select a day of birth from the drop-down
    [Arguments]     ${day_dropdown}    ${day_value}
    Select From List By Value    ${day_dropdown}    ${day_value}

Select a month of birth from the drop-down
    [Arguments]    ${month_dropdown}    ${month_value}
    Select From List By Value    ${month_dropdown}  ${month_value}

Select year of birth from the drop-down
    [Arguments]    ${year_dropdown}    ${year_value}
    Select From List By Value    ${year_dropdown}    ${year_value}

Select "Sign up for our newsletter!" checkbox
    [Arguments]     ${signup_checkbox}
    Wait Until Element Is Visible    ${signup_checkbox}
    Select Checkbox    ${signup_checkbox}

Verify "Address Information" section is visible
    Scroll Element Into View   ${COMPANY_NAME_ID}

Input valid first name
    [Arguments]    ${first_name_id}    ${valid_name}
    Input Text    ${first_name_id}    ${valid_name}

Input valid last name
    [Arguments]    ${last_name_id}    ${last_name_value}
    Input Text    ${last_name_id}    ${last_name_value}

Input valid company name
    [Arguments]   ${company_name_id}    @{company_name_value}
    Input Text    ${company_name_id}    @{company_name_value}
    
Input valid address
    [Arguments]    ${address1_id}   ${address1_value}
    Input Text    ${address1_id}   ${address1_value}
    
Input valid address 2
    [Arguments]    ${address2_id}   ${address2_value}
    Input Text    ${address2_id}   ${address2_value}

Select "Country" from the drop-down list
    [Arguments]    ${country_dropdown_id}   ${country_dropdown_value}
    Select From List By Value    ${country_dropdown_id}   ${country_dropdown_value}
    
Input valid State
    [Arguments]    ${state_id}  ${state_value}
    Input Text    ${state_id}  ${state_value}

Input valid City
    [Arguments]   ${city_id}    ${city_value}
    Input Text   ${city_id}    ${city_value}

Input valid Zipcode number
    [Arguments]  ${zipcode_id}  ${zipcode_value}
    Input Text    ${zipcode_id}  ${zipcode_value}
    
Input valid mobile number
    [Arguments]     ${mobile_number_id}    ${mobile_number_value}
    Input Text     ${mobile_number_id}    ${mobile_number_value}

Click "Create account" button
    Click Button    ${CREATE_ACCOUNT_BUTTON}

Verify that "Account Created!" section is visible
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Should Be Equal  ${header_text}  ${expected_text}

Click "Continue" button
    Click Link    ${CONTINUE_BUTTON_ID}

Click "Login" button
    Click Button    ${LOGIN_BUTTON_ID}

Verify that a "Login to your account" section is visible
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Should Be Equal  ${header_text}  ${expected_text}

Verify that 'Logged in as username' is visible
    [Arguments]  ${username}
    ${header_text}=  Get Text  xpath=//*[@id="header"]//li[10]/a
    Should Contain  ${header_text}  ${username}

"Your email or password is incorrect!" validation message is shown
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${message_text}=  Get Text  ${locator}
    Should Be Equal   ${message_text}  ${expected_text}

"Email Address already exist!" validation message is shown
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${message_text}=  Get Text  ${locator}
    Should Be Equal   ${message_text}  ${expected_text}

Click "Logout" button
    [Arguments]    ${logout_button_id}
    Click Link    ${logout_button_id}

Verify "Account deleted" header is shown
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Should Be Equal  ${header_text}  ${expected_text}

