*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SIGNUP_LOGIN_LINK} =  xpath=//*[@id="header"]//a[@href="/login"]
${CONTACT_UD_LINK} =  xpath=//*[@id="header"]//a[@href="/contact_us"]
${DELETE_ACCOUNT_LINK} =  xpath=//*[@class="nav navbar-nav"]/li[5]/a
${PRODUCTS_LINK} =  xpath=//*[@id="header"]//a[@href="/products"]

*** Keywords ***
Click "Signup/Login" link in the navigation menu
    Click Link    ${SIGNUP_LOGIN_LINK}

Click "Contact us" link in the navigation menu
    Click Link    ${CONTACT_UD_LINK}

Click "Delete Account" link
    Click Link    ${DELETE_ACCOUNT_LINK}

Click "Products" link in the navigation menu
    Click Link    ${PRODUCTS_LINK}

Verify success message 'You have been successfully subscribed!' is visible
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${snackbar_text}=  Get Text  ${locator}
    Log  Snackbar Text: ${snackbar_text}
    Should Contain  ${snackbar_text}  ${expected_text}

