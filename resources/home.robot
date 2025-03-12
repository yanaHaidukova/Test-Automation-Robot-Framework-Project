*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${HOME_PAGE_LINK}    https://automationexercise.com
${BROWSER}    headlesschrome
${HOME_CAROUSEL}    //*[@id="slider-carousel"]
${NEW_SIGNUP_HEADER}    //*[@id="form"]//div[2]/h2

*** Keywords ***
Go To Automation Exercise Website
    Open Browser  ${HOME_PAGE_LINK}       ${BROWSER}

Accept Cookies If Dialog Appears
    [Arguments]  ${locator}
    ${result}=  Run Keyword And Ignore Error  Wait Until Element Is Visible  ${locator}
    Run Keyword If  '${result}[0]' == 'PASS'  Click Element  ${locator}

     
