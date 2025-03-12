*** Settings ***
Library      SeleniumLibrary

*** Variables ***
${SEARCH_BUTTON}    //*[@id="submit_search"]
${PRODUCTS_LIST_LOCATOR}    //*[@class="col-sm-4"]
${NEXT_PRODUCT}    //*[@href="/product_details/4"]

*** Keywords ***
Check Products List Is Shown
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${PRODUCTS_LIST_LOCATOR}
    ${elements}=  Get WebElements  ${PRODUCTS_LIST_LOCATOR}
    ${count}=  Get Length  ${elements}
    Should Be True    ${count}>1    Products list should not be empty

Verify product card visible
    Scroll Element Into View    ${NEXT_PRODUCT}
    Wait Until Element Is Visible   ${NEXT_PRODUCT}

Check product name is displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Log     Paragraph text: ${paragraph_text}

Check product category is displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Log     Paragraph text: ${paragraph_text}

Check product price is displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Log     Paragraph text: ${paragraph_text}

Check product availability is displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Log     Paragraph text: ${paragraph_text}

Check product condition is displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Log     Paragraph text: ${paragraph_text}

Check product brand is displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Log     Paragraph text: ${paragraph_text}

Check Search Results Are Correct
    [Arguments]   ${paragraph_locator}    ${product}
    Wait Until Element Is Visible  ${paragraph_locator}
    ${paragraph_text}=  Get Text   ${paragraph_locator}
    Log  Paragraph Text: ${paragraph_text}
    Should Contain  ${paragraph_text}  Polo