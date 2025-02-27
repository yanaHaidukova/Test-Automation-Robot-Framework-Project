*** Settings ***
Resource    ../resources/created_keywrods.robot
Resource    ../resources/common_keywords.robot
Test Teardown   Close All Browsers

#robot -d results test_suites/contact_us_test.robot
*** Variables ***
${HEADER_LOCATOR_CONTACT_US} =   xpath=//div[@class="contact-form"]//h2
${EXPECTED_HEADER_TEXT_CONTACT_US} =  GET IN TOUCH
${EMAIL_CONTACT_ID} =  xpath=//input[@name="email"]
${SUBJECT_FILED_ID} =  xpath=//input[@name="subject"]
${SUBJECT_FILED_TEXT} =  Test subject
${MESSAGE_FIELD_ID} =  //textarea[@id="message"]
${MESSAGE_FIELD_TEXT} =  Message to contact us

*** Test Cases ***
Test Case 6: Contact Us Form
    [Tags]  UI tests Part 1
    Go to "Automation exercise" website
    Resize browser window
    Confirm cookies
    Verify that home page is visible
    Click "Contact us" link in the navigation menu
    Verify "Get in touch" section is visible    ${HEADER_LOCATOR_CONTACT_US}    ${EXPECTED_HEADER_TEXT_CONTACT_US}
    Input valid email   ${EMAIL_CONTACT_ID}   ${LOGGED_IN_USER_EMAIL}
    Fill in "Subject" field to contact      ${SUBJECT_FILED_ID}  ${SUBJECT_FILED_TEXT}
    Fill in "Message" field to contact       ${MESSAGE_FIELD_ID}     ${MESSAGE_FIELD_TEXT}
    Upload a file
    Click "Submit" Button


    

