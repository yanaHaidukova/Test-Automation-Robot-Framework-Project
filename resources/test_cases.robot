*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Verify User Is Navigated To Test Cases Page Successfully
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Should Be Equal  ${header_text}  ${expected_text}