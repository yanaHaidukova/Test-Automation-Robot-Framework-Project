*** Settings ***
Resource    ../resources/common_resources.robot
Library     BuiltIn
Test Setup    Go To Required Link    ${PRODUCTS_LINK}
Test Teardown   Close All Browsers

*** Variables ***
${PRODUCTS_LINK}    //*[@id="header"]//a[@href="/products"]
${PRODUCT_LINK_LOCATOR}    //a[@href="/product_details/1"]
${AD_CLOSE_BUTTON}    /html/body/ins[2]/*[1]//ins/span/svg/path
${SEARCH_LOCATOR}    //*[@id="search_product"]
${PRODUCT_NAME_LOCATOR}    //*[@class="product-information"]//h2
${CATEGORY_LOCATOR}    //*[@class="product-information"]//P
${PRICE_LOCATOR}    //*[@class="product-information"]//span/span
${AVAILABILITY_LOCATOR}    //*[@class="product-information"]//p[2]
${CONDITION_LOCATOR}    //*[@class="product-information"]//p[3]
${BRAND_LOCATOR}    //*[@class="product-information"]//p[4]
${HEADER_SEARCHED_PRODUCTS_LOCATOR}    //*[@class="features_items"]/h2
${HEADER_LOCATOR_PRODUCTS}    //h2[@class="title text-center"]
${NEXT_PRODUCT}    //*[@href="/product_details/4"]
${PRODUCT_NAME}     Dress
${PRODUCT_FROM_LIST}    //*[@class="single-products"]

*** Test Cases ***
Verify All Products And Product Details Page
    [Tags]  UI_tests_Part1
    Check Relevant Text Is Displayed    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Scroll Element Into View    ${NEXT_PRODUCT}
    Wait Until Element Is Visible   ${NEXT_PRODUCT}
    Click Link    ${PRODUCT_LINK_LOCATOR}
    Check Relevant Text Is Displayed    ${PRODUCT_NAME_LOCATOR}    Blue Top
    Wait Until Page Contains Element   ${PRODUCT_NAME_LOCATOR}
    Wait Until Page Contains Element    ${CATEGORY_LOCATOR}
    Wait Until Page Contains Element    ${PRICE_LOCATOR}
    Wait Until Page Contains Element    ${AVAILABILITY_LOCATOR}
    Wait Until Page Contains Element    ${CONDITION_LOCATOR}
    Wait Until Page Contains Element    ${BRAND_LOCATOR}

Verify User Can Search For Product
    [Tags]  UI_tests_Part1
    Check Relevant Text Is Displayed    ${HEADER_LOCATOR_PRODUCTS}    ALL PRODUCTS
    Search For Product    ${SEARCH_LOCATOR}    ${PRODUCT_NAME}    ${HEADER_SEARCHED_PRODUCTS_LOCATOR}
    Scroll Element Into View    ${SEARCH_LOCATOR}
    Check Search Results   ${PRODUCT_FROM_LIST}    ${PRODUCT_NAME}

