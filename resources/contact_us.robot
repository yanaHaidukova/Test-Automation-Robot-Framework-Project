*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem

*** Variables ***
${HEADER_LOCATOR_CONTACT_US}    //*[@class="contact-form"]//h2
${SUBMIT_FORM}    //input[@name="submit"]
${SUCCESS_SNACKBAR}    //*[@class="status alert alert-success"]

*** Keywords ***
Check Form Is Successfully Submited
    Handle Alert
    Wait Until Element Is Visible  ${SUCCESS_SNACKBAR}
    ${header_text}=  Get Text  ${SUCCESS_SNACKBAR}
    Log     ${header_text}
    Should Be Equal  ${header_text}  Success! Your details have been submitted successfully.

Check Get In Touch Section Is Visible
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${HEADER_LOCATOR_CONTACT_US}
    ${header_text}=  Get Text  ${HEADER_LOCATOR_CONTACT_US}
    Log     ${header_text}
    Should Be Equal  ${header_text}  GET IN TOUCH

Remove File From Resources
    [Arguments]    ${file_name}
    ${file_path}=    Set Variable    ${CURDIR}/${file_name}
    File Should Exist    ${file_path}
    Remove File    ${file_path}
    Log    File ${file_name} removed from Resources directory.
    File Should Not Exist    ${file_path}

