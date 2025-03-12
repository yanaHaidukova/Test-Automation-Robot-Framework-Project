*** Settings ***
Library      SeleniumLibrary
Resource    ../resources/login.robot
Resource    ../resources/search.robot
Resource    ../resources/top_nav.robot
Resource    ../resources/home.robot
Resource    ../resources/contact_us.robot
Resource    ../resources/products.robot
Resource    ../resources/test_cases.robot
Resource    ../resources/variables.robot

*** Variables ***
${EMAIL_FIELD_LOGIN_ID}    //input[@name="email"][@data-qa="login-email"]
${VALID_NAME}    Eva
${VALID_EMAIL}    evatestemail@gmail.com
${LOGGEDIN_HEADER_TEXT}    Logged in as
${CONTINUE_BUTTON_ID}    //*[@class="btn btn-primary"]
${LOGIN_BUTTON_ID}    //button[@type="submit"][@data-qa="login-button"]
${INVALID_USER_EMAIL}    hola@gmail.com
${LOGGEN_IN_USER_PASSWORD}    test
${INPUT_PASSWORD}    //input[@type="password"]
${INVALID_PASSWORD}    invalidpass1
${LOGGOUT_BUTTON_ID}    //*[@href="/logout"]
${CONFIRM_COOKIES}    //*[@role="button"][@aria-label="Consent"]
${HEADER_LOCATOR_CONTACT_US}    //*[@class="contact-form"]//h2
${ACCOUNT_CREATED_ID}    //*[@id="form"]//h2[@data-qa="account-created"]
${HEADER_LOCATOR_DELETED}    //*[@class="title text-center"]
${HEADER_LOCATOR_PRODUCTS}    //h2[@class="title text-center"]
${EMAIL_CONTACT_ID}    //input[@name="email"]
${UPLOAD_FILE_LOCATOR}    //input[@name="upload_file"]
${ERROR_INVALID_CREDENTIALS_ID}    //*[@id="form"]//p
${ERROR_INVALID_CREDENTIALS_TEXT}    Your email or password is incorrect!
${PRODUCT_DETAILS_NAME_LOCATOR}    //*[@class="product-information"]//h2
${PRODUCT_DETAILS_CATEGORY_LOCATOR}    //*[@class="product-information"]//P
${PRODUCT_DETAILS_PRICE_LOCATOR}    //*[@class="product-information"]//span/span
${PRODUCT_DETAILS_AVAILABILITY_LOCATOR}    //*[@class="product-information"]//p[2]
${PRODUCT_DETAILS_CONDITION_LOCATOR}    //*[@class="product-information"]//p[3]
${PRODUCT_DETAILS_BRAND_LOCATOR}    //*[@class="product-information"]//p[4]
${HEADER_SEARCHED_PRODUCTS_LOCATOR}    //*[@class="features_items"]/h2
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
${TEST_PRODUCT}    //*[@class="productinfo text-center"]//p


*** Keywords ***
Go To Automation Exercise Home Page
    Go To Automation Exercise Website
    Accept Cookies If Dialog Appears    ${CONFIRM_COOKIES}
    Wait Until Page Contains Element    ${HOME_CAROUSEL}

Verify User Can Enter Account Information
    Check User Can Select A Title    ${TITLE_RADIO_BUTTON}    Mr
    Check User Name And Email Are Pre-populated    ${VALID_NAME}    ${VALID_EMAIL}
    Input Password    ${PASSWORD_FIELD_ID}    ${PASSWORD_VALUE}
    Check User Can Select Date Of Birth    10    5    1999

Verify User Can Enter Address Information
    Input Text    ${FIRST_NAME_ID}    ${VALID_NAME}
    Input Text    ${LAST_NAME_ID}    Patison
    Input Text    ${COMPANY_NAME_ID}    SoftServe
    Input Text    ${ADDRESS1_ID}    Test address 1
    Input Text    ${ADDRESS2_ID}    Test address 2
    Select From List By Value    ${COUNTRY_DROPDOWN_ID}    Canada
    Input Text    ${STATE_ID}    Ontario
    Input Text    ${CITY_ID}    Toronto
    Input Text    ${ZIPCODE_ID}    123456
    Input Text    ${MOBILE_NUMBER_ID}    +12505550199

Verify A New User Is Successfully Logged In
    Check Logged In As Username Link Is Visible     ${VALID_NAME}

Log In User To Application
    [Arguments]  ${email}  ${password}
    Input Text  ${EMAIL_FIELD_LOGIN_ID}  ${email}
    Input Text  ${INPUT_PASSWORD}  ${password}
    Click Button  ${LOGIN_BUTTON_ID}

Log Out User From Account
    Click Button  ${LOGGOUT_BUTTON_ID}
    Check Login To Your Account Section Is Visible

Verify that user is successfully subscribed
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${snackbar_text}=  Get Text  ${locator}
    Log  Snackbar Text: ${snackbar_text}
    Should Contain  ${snackbar_text}  ${expected_text}

Finish test
    Go To Automation Exercise Home Page
    Maximize Browser Window
    Accept Cookies If Dialog Appears    ${CONFIRM_COOKIES}
    Wait Until Page Contains Element    ${HOME_CAROUSEL}
    Click Link    ${SIGNUP_LOGIN_LINK}
    Input Text  ${EMAIL_FIELD_LOGIN_ID}  ${VALID_EMAIL}
    Input Text  ${INPUT_PASSWORD}  ${PASSWORD_VALUE}
    Click Button  ${LOGIN_BUTTON_ID}
    Click Link    ${DELETE_ACCOUNT_LINK}
    Verify Account Is Successfully Deleted    ${HEADER_LOCATOR_DELETED}     ACCOUNT DELETED!
    Close All Browsers

Verify Account Is Successfully Created
    Check Account Created Section Is Visible      ${ACCOUNT_CREATED_ID}    ACCOUNT CREATED!

Verify User Is Successfully Logged In
    Check Logged In As Username Link Is Visible    ${VALID_NAME}

Choose And Upload File
    Choose File    ${UPLOAD_FILE_LOCATOR}    ${FILE_PATH}

Upload File
    [Arguments]  ${file_path}
    Choose File  ${UPLOAD_FILE_LOCATOR}  ${file_path}

Verify Account Is Successfully Deleted
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${HEADER_LOCATOR_DELETED}
    ${header_text}=  Get Text  ${HEADER_LOCATOR_DELETED}
    Should Be Equal  ${header_text}  ACCOUNT DELETED!

Verify Relevant Product Details Are Shown
    Check product name is displayed    ${PRODUCT_DETAILS_NAME_LOCATOR}
    Check product category is displayed   ${PRODUCT_DETAILS_CATEGORY_LOCATOR}
    Check product price is displayed  ${PRODUCT_DETAILS_PRICE_LOCATOR}
    Check product availability is displayed   ${PRODUCT_DETAILS_AVAILABILITY_LOCATOR}
    Check product condition is displayed  ${PRODUCT_DETAILS_CONDITION_LOCATOR}
    Check product brand is displayed      ${PRODUCT_DETAILS_BRAND_LOCATOR}

Search For Product
    [Arguments]    ${search_locator}    ${product}
    Input Text    ${SEARCH_LOCATOR}    ${product}
    Click Button   ${SEARCH_BUTTON}


Verify Searched Results Are Shown On The Page
    Scroll Element Into View    ${HEADER_SEARCHED_PRODUCTS_LOCATOR}
    Check Search Results Are Correct    ${TEST_PRODUCT}    Polo



