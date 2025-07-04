*** Settings ***
Library      SeleniumLibrary
Resource    ../resources/login.robot
Resource    ../resources/contact_us.robot
Resource    ../resources/products.robot
Resource    ../resources/variables.robot

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
${HOME_CAROUSEL}    //*[@id="slider-carousel"]
${HEADER_LOCATOR_NEW_SIGNIN}    //*[@class="signup-form"]//h2
${HEADER_LOCATOR_LOGIN}    //*[@class="login-form"]//h2
${SIGNUP_LOGIN_LINK}    //*[@id="header"]//a[@href="/login"]
${HEADER_LOCATOR_LOGIN}    //*[@class="login-form"]//h2
${LOGGEDIN_SUCCESS}     //*[@id="header"]//li[10]/a
${DELETE_ACCOUNT_LINK}    //a[contains (text(), 'Delete Account')]
${RADIO_BUTTON_XPATH_TEMPLATE}    //input[@name='{name}'][@value='{value}']
${ADD_ITEM_TO_CART}    //a[@data-product-id="{product_id}"]
${MODAL_ADDED_CART}    //*[@class="modal-body"]/p[1]
${CONTINUE_SHOPPING}    //button[text()= 'Continue Shopping']
${VIEW_PRODUCT}    //a[@href="/product_details/'{product_id}'"]
${AD_CLOSE_BUTTON}    //*[@class='grippy-host']

*** Keywords ***
Confirm Cookies If Present
    [Arguments]    ${close_button_locator}
    ${status}    ${message}=  Run Keyword And Ignore Error    Wait Until Element Is Visible    ${close_button_locator}
    Run Keyword If    '${status}' == 'PASS'    Click Element    ${close_button_locator}

Close Advertisement If Present
    ${ads_visible}=   Execute JavaScript    var e = document.querySelector('#aswift_3_host'); return e && e.offsetParent !== null;
    Run Keyword If    ${ads_visible}    Run Keyword And Ignore Error    Execute JavaScript    document.querySelector('.grippy-host').click();

Scroll Page And Close Advertisement
    [Arguments]    ${expected_locator}
    Scroll Element Into View    ${expected_locator}
    Close Advertisement If Present

Go To Automation Exercise Home Page
    Open Browser    ${HOME_PAGE_LINK}      ${BROWSER}
    Confirm Cookies If Present    ${CONFIRM_COOKIES}
    Wait Until Page Contains Element    ${HOME_CAROUSEL}

Go To Required Link
    [Arguments]    ${required_link}    ${text_locator}    ${expected_text}
    Click Link    ${required_link}
    Confirm Cookies If Present    ${CONFIRM_COOKIES}
    Close Advertisement If Present
    Check Relevant Text Is Displayed    ${text_locator}    ${expected_text}

Check Relevant Text Is Displayed
    [Arguments]   ${text_locator}   ${expected_text}
    Wait Until Element Is Visible    ${text_locator}
    ${actual_text}=  Get Text    ${text_locator}
    Should Be Equal As Strings    ${actual_text}   ${expected_text}

Register User With New Name And Email
    [Arguments]    ${name}    ${email}    ${registration_locator}    ${registration_status}
    Input And Verify Text Field    ${NAME_FIELD_ID}    ${name}
    Input And Verify Text Field    ${EMAIL_FIELD_ID}    ${email}
    Click Button    ${SIGNUP_BUTTON}
    Check Relevant Text Is Displayed    ${registration_locator}    ${registration_status}
    Check User Can Enter Account Information    ${name}    ${email}
    Scroll Element Into View    ${COMPANY_NAME_ID}
    Wait Until Element Is Visible    ${SIGNUP_CHECKBOX}
    Check User Can Select A Checkbox    ${SIGNUP_CHECKBOX}
    Check User Can Enter Address Information    @{ADDRESS_INFORMATION}
    Click Button    ${CREATE_ACCOUNT_BUTTON}
    Wait Until Element Is Visible      ${ACCOUNT_CREATED_ID}
    Click Link    ${CONTINUE_BUTTON_ID}
    Element Should Contain    ${LOGGEDIN_SUCCESS}    ${name}

Check User Can Select A Checkbox
    [Arguments]   ${checkbox_locator}
    Select Checkbox    ${checkbox_locator}
    ${is_selected}=  Get Element Attribute  ${checkbox_locator}  checked
    Should Be Equal  ${is_selected}  true

Select Option From Drop Down
    [Arguments]    ${drop_down_locator}    ${drop_down_value}
    Select From List By Value    ${drop_down_locator}   ${drop_down_value}
    ${value_selected}=  Get Selected List Value    ${drop_down_locator}
    Should Be Equal    ${value_selected}    ${drop_down_value}

Login And Delete Account
    [Arguments]    ${email}    ${password}   ${name}
    Open Browser    ${HOME_PAGE_LINK}    ${BROWSER}
    Confirm Cookies If Present    ${CONFIRM_COOKIES}
    Wait Until Page Contains Element    ${HOME_CAROUSEL}
    Click Link    ${SIGNUP_LOGIN_LINK}
    Wait Until Element Is Visible    ${HEADER_LOCATOR_NEW_SIGNIN}
    Check Usen Can Log In With Valid Credentials    ${email}    ${password}   ${name}    ${LOGGEDIN_SUCCESS}
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
    Element Attribute Value Should Be    ${radio_button_locator}    checked    true

Check User Can Add Product To Cart
    [Arguments]    ${product_locator}    ${product_id}    ${added_product_id}
    ${product_locator}=  Replace String    ${VIEW_PRODUCT}    {product_id}    ${product_id}
    Scroll Element Into View    ${product_locator}
    Element Should Be Visible    ${product_locator}
    Mouse Over    ${product_locator}
    ${add_to_cart_locator}=  Replace String    ${ADD_ITEM_TO_CART}    {product_id}    ${product_id}
    Wait Until Element Is Visible    ${add_to_cart_locator}
    Click Link    ${add_to_cart_locator}
    Check Relevant Text Is Displayed    ${MODAL_ADDED_CART}    Your product has been added to cart.
    ${added_product}=    Set Variable    product-${product_id}
    Set Test Variable    ${ADDED_PRODUCT_ID}    ${added_product}
    [Return]    ${ADDED_PRODUCT_ID}


