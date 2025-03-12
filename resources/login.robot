*** Settings ***
Library     SeleniumLibrary
Library     String
*** Variables ***
${NAME_FIELD_ID}    //input[@name="name"]
${VALID_NAME}    Eva
${EMAIL_FIELD_ID}    //input[@name="email"][@data-qa="signup-email"]
${VALID_EMAIL}    evatestemail@gmail.com
${DAY_DROPDOWN}    //*[@id="days"]
${MONTH_DROPDOWN}    //*[@id="months"]
${YEAR_DROPDOWN}    //*[@id="years"]
${SIGNUP_CHECKBOX}    //*[@id="newsletter"]
${SIGNUP_BUTTON}    //button[@type="submit"][@data-qa="signup-button"]
${CONTINUE_BUTTON_ID}    //*[@class="btn btn-primary"]
${HEADER_LOCATOR_ACCOUNT_INFO}    //*[@class="login-form"]/h2
${EXPECTED_HEADER_TEXT_ACCOUNT_INFO}    ENTER ACCOUNT INFORMATION
${TITLE_RADIO_BUTTON}    title
${NAME_FIELD_POPULATED}    //input[@id="name"]
${EMAIL_FIELD_POPULATED}    //input[@id="email"]
${HEADER_LOCATOR_NEW_SIGNIN}    //*[@class="signup-form"]//h2
${EXPECTED_HEADER_TEXT_NEWSIGNIN}    New User Signup!
${LOGIN_BUTTON_ID}    //button[@type="submit"][@data-qa="login-button"]
${COMPANY_NAME_ID}    //*[@id="company"]
${STATE_ID}    //*[@id="state"]
${EMAIL_FIELD_LOGIN_ID}    //input[@name="email"][@data-qa="login-email"]
${INPUT_PASSWORD}    //input[@type="password"]
${ERROR_INVALID_CREDENTIALS_ID}    //*[@id="form"]//p
${ERROR_EXISTING_USER_ID}    //*[@id="form"]//p
${HEADER_LOCATOR_LOGIN}    //*[@class="login-form"]//h2

*** Keywords ***
Check New User Signup Section Is Visible
    Wait Until Element Is Visible    ${HEADER_LOCATOR_NEW_SIGNIN}
    ${header_text}=  Get Text  ${HEADER_LOCATOR_NEW_SIGNIN}
    Should Be Equal  ${header_text}  ${EXPECTED_HEADER_TEXT_NEWSIGNIN}

Check Login To Your Account Section Is Visible
    Wait Until Element Is Visible    ${HEADER_LOCATOR_LOGIN}
    ${header_text}=  Get Text  ${HEADER_LOCATOR_LOGIN}
    Log    ${header_text}
    Should Be Equal  ${header_text}   Login to your account

Verify User Can Input User Name And Email
    [Arguments]    ${user_name}    ${user_email}
    Input Text    ${NAME_FIELD_ID}  ${valid_name}
    Input Text    ${EMAIL_FIELD_ID}   ${valid_email}
    Click Button    ${SIGNUP_BUTTON}

Verify User Is Successfully Redirected To Enter Account Information Page
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Log    ${header_text}
    Should Be Equal  ${header_text}  ${expected_text}

Check User Can Select A Title
  [Arguments]  ${name}  ${value}
  ${xpath} =  Replace String  ${TITLE_RADIO_BUTTON}  {name}  ${name}
  ${xpath} =  Replace String  ${TITLE_RADIO_BUTTON}  {value}  ${value}

Check User Name And Email Are Pre-populated
   [Arguments]    ${user_name}    ${user_email}
   Textfield Should Contain    ${NAME_FIELD_POPULATED}    ${valid_name}
   Textfield Should Contain    ${EMAIL_FIELD_POPULATED}   ${valid_email}

Check User Can Select Date Of Birth
    [Arguments]    ${day_value}    ${month_value}    ${year_value}
    Select From List By Value    ${DAY_DROPDOWN}    ${day_value}
    Select From List By Value    ${MONTH_DROPDOWN}  ${month_value}
    Select From List By Value    ${YEAR_DROPDOWN}   ${year_value}

Input existing user name
    [Arguments]     ${name_field_id}    ${existing_name}
    Input Text    ${name_field_id}    ${existing_name}

Input existing email
     [Arguments]     ${email_field_id}    ${email_name}
     Input Text     ${email_field_id}   ${email_name}

Input incorrect email into the "Email address" field
     [Arguments]     ${email_field_id}    ${invalid_email_name}
     Input Text     ${email_field_id}   ${invalid_email_name}

Verify User Can Sing Up for Newsletter
    Scroll Element Into View    ${COMPANY_NAME_ID}
    Wait Until Element Is Visible    ${SIGNUP_CHECKBOX}
    Select Checkbox    ${SIGNUP_CHECKBOX}

Check Account Created Section Is Visible
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Log    ${header_text}
    Should Be Equal  ${header_text}  ${expected_text}

Verify that a "Login to your account" section is visible
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Should Be Equal  ${header_text}  ${expected_text}

Check Logged In As Username Link Is Visible
    [Arguments]  ${username}
    ${header_text}=  Get Text  //*[@id="header"]//li[10]/a
    Should Contain  ${header_text}  ${username}

Verify User Cannot Login
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${ERROR_INVALID_CREDENTIALS_ID}
    ${message_text}=  Get Text  ${ERROR_INVALID_CREDENTIALS_ID}
    Log    ${message_text}
    Should Be Equal   ${message_text}  Your email or password is incorrect!

Verify User Cannot Create An Account
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${ERROR_EXISTING_USER_ID}
    ${message_text}=  Get Text  ${ERROR_EXISTING_USER_ID}
    Log    ${message_text}
    Should Be Equal   ${message_text}  Email Address already exist!

Click "Logout" button
    [Arguments]    ${logout_button_id}
    Click Link    ${logout_button_id}


