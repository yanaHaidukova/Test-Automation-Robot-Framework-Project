*** Settings ***
Library      SeleniumLibrary

*** Variables ***
${SEARCH_BUTTON}    //*[@id="submit_search"]
${PRODUCTS_LIST_LOCATOR}    //*[@class='features_items']

*** Keywords ***
Check Product Details Are Displayed
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}
    Element Should Be Visible    ${locator}

Check Search Results
    [Arguments]  ${product_locator}  ${search_term}
    ${products}=  Get WebElements  ${product_locator}
    FOR  ${product}  IN  @{products}
        ${product_text}=  Get Text  ${product}
        Log  Checking product: ${product_text}
        Run Keyword And Continue On Failure  Should Contain  ${product_text}  ${search_term}
    END