*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Verify user is navigated to "Test cases" page successfully
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Should Be Equal  ${header_text}  ${expected_text}