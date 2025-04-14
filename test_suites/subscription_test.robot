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

*** Test Cases ***
Verify Subscription in home page
    [Tags]  UI_tests_Part1
    Scroll Element Into View    ${FOOTER_LOCATOR}
    Input Text    ${EMAIL_FIELD_SUBSCRIBE_ID}    ${LOGGED_IN_USER_EMAIL}
    Click Button    ${SUBSCRIBE_BUTTON}
    Check Expected Notifications    ${SNACKBAR_LOCATOR}    You have been successfully subscribed!


