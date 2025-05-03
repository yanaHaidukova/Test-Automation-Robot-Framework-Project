*** Settings ***
Resource    ../resources/common_resources.robot
Library    OperatingSystem
Test Setup    Go To Required Link    ${CONTACT_US_LINK}    ${HEADER_LOCATOR_CONTACT_US}    GET IN TOUCH
Suite Teardown    Close All Browsers

*** Variables ***
${CONTACT_US_LINK}    //*[@href="/contact_us"]
${HEADER_LOCATOR_CONTACT_US}    //*[@class="contact-form"]//h2
${NAME_FIELD_ID}    //input[@name="name"]
${EMAIL_CONTACT_ID}    //input[@name="email"]
${SUBJECT_FILED_ID}    //input[@name="subject"]
${MESSAGE_FIELD_ID}    //textarea[@id="message"]
${VALID_EMAIL}    evatestemail@gmail.com
${FILE_NAME}    test_upload_file.txt
${FILE_CONTENT}    This is a test file for upload.
${FOOTER}    //*[@class="footer-bottom"]
${SUCCESS_SUBMITION}    Success! Your details have been submitted successfully.
${SUCCESS_SNACKBAR}    //*[@class="status alert alert-success"]
${SUBMIT_FORM}    //input[@name="submit"]

*** Test Cases ***
Verify User Can Submit Contact Us Form
    [Tags]  UI_tests_Part1
    [Teardown]  Remove File From Resources    ${FILE_NAME}
    Input And Verify Text Field    ${NAME_FIELD_ID}    Eva
    Input And Verify Text Field    ${EMAIL_CONTACT_ID}    ${VALID_EMAIL}
    Input And Verify Text Field    ${SUBJECT_FILED_ID}    Test subject
    Scroll Element Into View    ${MESSAGE_FIELD_ID}
    Input Text    ${MESSAGE_FIELD_ID}    Message to contact us
    Should Not Be Empty    ${MESSAGE_FIELD_ID}
    Create And Upload File    ${FILE_NAME}    ${FILE_CONTENT}
    Scroll Element Into View    ${FOOTER}
    Element Should Be Visible    ${SUBMIT_FORM}
    Click Button      ${SUBMIT_FORM}
    Handle Alert
    Check Relevant Text Is Displayed    ${SUCCESS_SNACKBAR}    ${SUCCESS_SUBMITION}




    

