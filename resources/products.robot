*** Settings ***
Library      SeleniumLibrary

*** Variables ***
${SEARCH_BUTTON}    //*[@id="submit_search"]
${PRODUCTS_LIST_LOCATOR}    //*[@class='features_items']
${NEXT_PRODUCT}    //*[@href="/product_details/4"]

*** Keywords ***
Check Products List Is Shown
    Wait Until Element Is Visible  ${PRODUCTS_LIST_LOCATOR}
    Element Should Be Visible    ${PRODUCTS_LIST_LOCATOR}

Check product card visible
    Scroll Element Into View    ${NEXT_PRODUCT}
    Wait Until Element Is Visible   ${NEXT_PRODUCT}

Check User Is Redirected To Product Details Page
    [Arguments]    ${product_name_locator}     ${product_name}
    Wait Until Element Is Visible    ${product_name_locator}
    ${expected_header}=    Get text    ${product_name_locator}
    Should Be Equal As Strings    ${expected_header}    ${product_name}

Check Product Name Is Displayed
    [Arguments]    ${locator}    ${product_name}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=    Get Text  ${locator}
    Should Be Equal As Strings    ${paragraph_text}    ${product_name}

Check Product Category Is Displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=    Get Text  ${locator}
    Should Not Be Empty    ${paragraph_text}

Check Product Price Is Displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Should Not Be Empty    ${paragraph_text}

Check Product Availability Is Displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Should Not Be Empty    ${paragraph_text}

Check Product Condition Is Displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Should Not Be Empty    ${paragraph_text}

Check Product Brand Is Displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Should Not Be Empty    ${paragraph_text}

Check Search Results Are Correct
    [Arguments]   ${paragraph_locator}    ${product_name}
    Wait Until Element Is Visible  ${paragraph_locator}
    ${paragraph_text}=  Get Text   ${paragraph_locator}
    Should Contain    ${paragraph_text}    ${product_name}