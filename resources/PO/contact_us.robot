*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SUBMIT_FORM} =  xpath=//input[@name="submit"]


*** Keywords ***
Fill in "Subject" field to contact
    [Arguments]     ${subject_field_id}    ${subject_text}
     Input Text     ${subject_field_id}    ${subject_text}

Fill in "Message" field to contact
    [Arguments]     ${message_field_id}    ${message_text}
     Input Text     ${message_field_id}    ${message_text}

Choose and upload a file
    [Arguments]  ${file_path}
    Choose File  name=upload_file  ${file_path}
    
Click "Submit" button
    Click Button      ${SUBMIT_FORM}

Verify "Get in touch" section is visible
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Should Be Equal  ${header_text}  ${expected_text}


