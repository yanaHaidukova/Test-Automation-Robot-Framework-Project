*** Settings ***
Library      SeleniumLibrary

*** Variables ***
${SEARCH_BUTTON} =  id=submit_search

*** Keywords ***
Verify list of products is displayed on the page
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${elements}=  Get WebElements  ${locator}
    ${count}=  Get Length  ${elements}
    Should Be True    ${count}>1    Products list should not be empty

Click "View product" button on the product card
    [Arguments]     ${product_link_locator}
    Scroll Element Into View    ${product_link_locator}
    Element Should Be Visible   ${product_link_locator}
    Sleep   3s
    Click Link     ${product_link_locator}

Verify product card visible
    [Arguments]     ${product_link_locator}
    Scroll Element Into View    ${product_link_locator}
    Element Should Be Visible   ${product_link_locator}
    Sleep   3s

Verify that product details are shown
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}

Verify that product name is displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Log     Paragraph text: ${paragraph_text}

Verify that product category is displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Log     Paragraph text: ${paragraph_text}

Verify that product price is displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Log     Paragraph text: ${paragraph_text}

Verify that product availability is displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Log     Paragraph text: ${paragraph_text}

Verify that product condition is displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Log     Paragraph text: ${paragraph_text}

Verify that product brand is displayed
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}
    ${paragraph_text}=  Get Text  ${locator}
    Log     Paragraph text: ${paragraph_text}


Verify that "All products" header is shown
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Should Be Equal  ${header_text}  ${expected_text}


Enter product name in search field
    [Arguments]     ${search_locator}   ${product_name}
    Input Text   ${search_locator}    ${product_name}

CLick "Search" button
    Click Button   ${SEARCH_BUTTON}

Verify 'SEARCHED PRODUCTS' header is shown
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    ${header_text}=  Get Text  ${locator}
    Should Be Equal  ${header_text}  ${expected_text}

Verify that search results are correct
    [Arguments]   ${paragraph_locator}
    Wait Until Element Is Visible  ${paragraph_locator}
    ${paragraph_text}=  Get Text   ${paragraph_locator}
    Log  Paragraph Text: ${paragraph_text}
    Should Contain  ${paragraph_text}  Polo