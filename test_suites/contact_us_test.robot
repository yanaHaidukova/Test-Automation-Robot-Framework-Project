*** Settings ***
Resource    ../resources/common_resources.robot
Library    OperatingSystem
Test Teardown   Close All Browsers

#robot -d results test_suites/contact_us_test.robot
*** Variables ***
${HEADER_LOCATOR_CONTACT_US}    //*[@class="contact-form"]//h2
${NAME_FIELD_ID}    //input[@name="name"]
${EMAIL_CONTACT_ID}    //input[@name="email"]
${SUBJECT_FILED_ID}    //input[@name="subject"]
${MESSAGE_FIELD_ID}    //textarea[@id="message"]
${VALID_EMAIL}    evatestemail@gmail.com
${FILE_NAME}    test_upload_file.txt
${FILE_CONTENT}    This is a test file for upload.
${FOOTER}    //*[@class="footer-bottom"]

*** Test Cases ***
Verify Use Can Fill In Contact Us Form
    [Tags]  UI_tests_Part1
    [Setup]  Go To Automation Exercise Home Page
    [Teardown]  Remove File From Resources    ${FILE_NAME}
    Check User Can Navigate To Contact Us Page
    Input Text    ${NAME_FIELD_ID}    Eva
    Textfield Should Contain    ${NAME_FIELD_ID}    Eva
    Input Text    ${EMAIL_CONTACT_ID}    ${VALID_EMAIL}
    Textfield Should Contain    ${EMAIL_CONTACT_ID}    ${VALID_EMAIL}
    Input Text    ${SUBJECT_FILED_ID}    Test subject
    Textfield Should Contain    ${SUBJECT_FILED_ID}    Test subject
    Scroll Element Into View    ${MESSAGE_FIELD_ID}
    Input Text    ${MESSAGE_FIELD_ID}    Message to contact us
    Should Not Be Empty    ${MESSAGE_FIELD_ID}
    Create And Upload File    ${FILE_NAME}    ${FILE_CONTENT}
    Scroll Element Into View    ${FOOTER}
    Element Should Be Visible    ${SUBMIT_FORM}
    Click Button      ${SUBMIT_FORM}
    Check Form Is Successfully Submited


    

