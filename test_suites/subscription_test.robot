*** Settings ***
Resource    ../resources/created_keywrods.robot
Resource    ../resources/common_keywords.robot
Test Teardown   Close All Browsers

#robot -d results test_suites/subscription_test.robot

*** Variables ***
${EMAIL_FIELD_SUBSCRIBE_ID} =  id=susbscribe_email
${LOGGED_IN_USER_EMAIL} =  alexxx@gmail.com

*** Test Cases ***
Test Case 10: Verify Subscription in home page
    [Tags]  UI tests Part 1
    Go to "Automation exercise" website
    Resize browser window
    Confirm cookies
    Verify that home page is visible
    Scroll the page down to the footer
    Input valid email   ${EMAIL_FIELD_SUBSCRIBE_ID}   ${LOGGED_IN_USER_EMAIL}
    Click "Subscribe" button
    Verify that user is successfully subscribed

