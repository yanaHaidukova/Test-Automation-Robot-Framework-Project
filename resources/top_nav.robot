*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/common_resources.robot

*** Variables ***
${SIGNUP_LOGIN_LINK}    //*[@id="header"]//a[@href="/login"]
${CONTACT_US_LINK}    //*[@href="/contact_us"]
${DELETE_ACCOUNT_LINK}    //*[@href="/delete_account"]
${PRODUCTS_LINK}    //*[@id="header"]//a[@href="/products"]
${HEADER_LOCATOR_NEW_SIGNIN}    //*[@class="signup-form"]//h2
${EXPECTED_HEADER_TEXT_NEWSIGNIN}    New User Signup!
${EXPECTED_HEADER_TEXT_LOGIN}    Login to your account
${HEADER_LOCATOR_LOGIN}    //*[@class="login-form"]//h2
${HEADER_LOCATOR_CONTACT_US}    //*[@class="contact-form"]//h2

*** Keywords ***
Verify User Can Navigate To Sign Up Page
    Click Link    ${SIGNUP_LOGIN_LINK}
    Check New User Signup Section Is Visible

Verify User Can Navigate To Login Page
    Click Link    ${SIGNUP_LOGIN_LINK}
    Check Login To Your Account Section Is Visible

Verify User Can Navigate To Contact Us Page
    Click Link    ${CONTACT_US_LINK}
    Check Get In Touch Section Is Visible    ${HEADER_LOCATOR_CONTACT_US}    GET IN TOUCH

Verify User Can Navigate To Products Page
    Click Link    ${PRODUCTS_LINK}
    Check Products List Is Shown    ${PRODUCTS_LIST_LOCATOR}

