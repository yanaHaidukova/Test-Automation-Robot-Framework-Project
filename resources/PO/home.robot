*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${HOME_PAGE_LINK} =  https://automationexercise.com
${BROWSER} =  CHROME
${HOME_CAROUSEL} =  xpath=//div[@id="slider-carousel"]
${NEW_SIGNUP_HEADER} =  xpath=//*[@id="form"]//div[2]/h2
${CONFIRM_COOKIES} =  xpath=//*[@role="button"] [@aria-label="Consent"]
${TEST_CASES_BUTTON} =  xpath=//div[@id="slider-carousel"]//a[1]/button


*** Keywords ***
Go to "Automation exercise" website
    Open Browser  ${HOME_PAGE_LINK}       ${BROWSER}

Verify that home page is visible
    Wait Until Page Contains Element    ${HOME_CAROUSEL}

    
Click "Consent cookies" button
    Click Button    ${CONFIRM_COOKIES}

Accept Cookies If Dialog Appears
    [Arguments]  ${locator}
    ${result}=  Run Keyword And Ignore Error  Wait Until Element Is Visible  ${locator}  timeout=5s
    Run Keyword If  '${result}[0]' == 'PASS'  Click Element  ${locator}


Click "Test cases" button
    Click Button     ${TEST_CASES_BUTTON}
     
