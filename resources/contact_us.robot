*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${HEADER_LOCATOR_CONTACT_US}    //*[@class="contact-form"]//h2
${SUBMIT_FORM}    //input[@name="submit"]
${SUCCESS_SNACKBAR}    //*[@class="status alert alert-success"]

*** Keywords ***
Verify Form Is Successfully Submited
    Click Button      ${SUBMIT_FORM}
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


