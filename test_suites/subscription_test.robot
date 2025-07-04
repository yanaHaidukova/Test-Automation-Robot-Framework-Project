*** Settings ***
Resource    ../resources/common_resources.robot
Test Setup    Go To Automation Exercise Home Page
Test Teardown   Close All Browsers

*** Variables ***
${EMAIL_FIELD_SUBSCRIBE_ID}    //*[@id="susbscribe_email"]
${LOGGED_IN_USER_EMAIL}    alexxx@gmail.com
${FOOTER_LOCATOR}    //*[@class="single-widget"]
${SUBSCRIBE_BUTTON}    //*[@id="subscribe"]
${SNACKBAR_LOCATOR}    //*[@id="success-subscribe"]
${CART_LINK}    //*[@id="header"]//a[@href="/view_cart"]
${CART_PAGE}    //li[text()= 'Shopping Cart']

*** Test Cases ***
Verify User Can Subsribe To Receive Notifications
    [Tags]  UI_tests_Part1
    Scroll Element Into View    ${FOOTER_LOCATOR}
    Input And Verify Text Field    ${EMAIL_FIELD_SUBSCRIBE_ID}    ${LOGGED_IN_USER_EMAIL}
    Click Button    ${SUBSCRIBE_BUTTON}
    Check Relevant Text Is Displayed    ${SNACKBAR_LOCATOR}    You have been successfully subscribed!

Verify User Can Subscribe From Cart Page
    [Tags]  UI_tests_Part2
    Go To Required Link    ${CART_LINK}    ${CART_PAGE}    Shopping Cart
    Scroll Element Into View    ${FOOTER_LOCATOR}
    Input And Verify Text Field    ${EMAIL_FIELD_SUBSCRIBE_ID}    ${LOGGED_IN_USER_EMAIL}
    Click Button    ${SUBSCRIBE_BUTTON}
    Check Relevant Text Is Displayed    ${SNACKBAR_LOCATOR}    You have been successfully subscribed!
