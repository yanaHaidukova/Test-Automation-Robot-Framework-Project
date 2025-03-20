*** Settings ***
Resource    ../resources/common_resources.robot
Resource    ../resources/variables.robot
Test Teardown   Close All Browsers

#robot -d results test_suites/contact_us_test.robot
*** Variables ***
${HEADER_LOCATOR_CONTACT_US}    //*[@class="contact-form"]//h2
${EMAIL_CONTACT_ID}    //input[@name="email"]
${SUBJECT_FILED_ID}    //input[@name="subject"]
${MESSAGE_FIELD_ID}    //*[@id="message"]
${VALID_EMAIL}    evatestemail@gmail.com
${RAW_FILE_PATH}    ${CURDIR}\\files\\understanding-abstract-art.jpg

*** Test Cases ***
Contact Us Form
    [Tags]  UI_tests_Part1
    [Documentation]  This test case should verify if the user can fill in and send a feedback though the form
    [Setup]  Go To Automation Exercise Home Page
    Verify User Can Navigate To Contact Us Page
    Input Text    ${EMAIL_CONTACT_ID}    ${VALID_EMAIL}
    Input Text    ${SUBJECT_FILED_ID}    Test subject
    Input Text    ${MESSAGE_FIELD_ID}    Message to contact us
    Upload File    ${RAW_FILE_PATH}
    Verify Form Is Successfully Submited


    

